//
//  TrackingTableViewController.swift
//  momhood3
//
//  Created by laptop on 2019-07-16.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class TrackingTableViewController: UITableViewController, UITextFieldDelegate, WeekCalendarDelegate {

    var selectedWeek: Int = -1
    
    @IBOutlet weak var calendarBarButtom: UIBarButtonItem!
    @IBOutlet weak var weekCalendarControl: WeekCalendarControl!
    @IBOutlet weak var moodControl: MoodControl!
    @IBOutlet weak var waistUnit: UILabel!
    @IBOutlet weak var weightUnit: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.delegate = self
        waistTextField.delegate = self
        weekCalendarControl.delegate = self
        
        //Adding "Done" button to numeric keyboard
        weightTextField.addDoneButtonToKeyboard(myAction:  #selector(self.weightTextField.resignFirstResponder))
        waistTextField.addDoneButtonToKeyboard(myAction:  #selector(self.waistTextField.resignFirstResponder))

        //hides the shadow from navigation bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        //show navigation bar
        self.navigationController!.isNavigationBarHidden = false
        //set page title
        //navigationItem.title = "Week \(currentWeek.week_count ?? 0)"
        
        //format text fields to show only bottom border
        weightTextField.setBottomBorder()
        waistTextField.setBottomBorder()
                
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //set week calendar first day
        if selectedWeek == -1 {
            weekCalendarControl.firstDayOfWeek = pregnancy.firstDayOfWeek.last!
            //set page title
            navigationItem.title = "Week \(currentWeek.week_count ?? 1)"
            //set page subtitle
            subtitleLabel.text = "\(currentWeek.period ?? "")    \(pregnancy.daysToGo) days to go"
            

        } else {
            weekCalendarControl.firstDayOfWeek = pregnancy.firstDayOfWeek[selectedWeek]
            //set page title
            navigationItem.title = "Week \(selectedWeek + 1)"
            //set page subtitle
            let filtered = timeline.filter{ ($0.week_count == selectedWeek + 1) }
            subtitleLabel.text = "\(filtered[0].period ?? "")    \(pregnancy.daysToGo) days to go"
            

        }
        
        loadSelectedDateInfo(for: weekCalendarControl.getSelectedDate())
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        saveDateInfo(for: weekCalendarControl.getSelectedDate())
        saveTrackingValues(values: momTrackingValues)
        
    }
    
    @IBAction func done (_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    func saveDateInfo(for date: Date) {

        let timeInterval = date.timeIntervalSince1970
        let infoFiltered = momTrackingValues.filter({$0.inputDate == timeInterval})
        
        if infoFiltered.count > 0  {

            momTrackingValues = momTrackingValues.map{
                var modifiedData = $0
                if $0.inputDate == timeInterval {
                    modifiedData.moodId = moodControl.mood
                    if let weight = Double(weightTextField.text!) {
                        modifiedData.weightValue = weight
                        modifiedData.weightUnit = weightUnit.text
                    }
                    if let waist = Double(waistTextField.text!) {
                        modifiedData.waistValue = waist
                        modifiedData.waistUnit = waistUnit.text
                    }
                    
                }
                return modifiedData
            }
        
        } else {
            //create new data entry
            var newData = TrackingInfo()
            var enteredNewData = false
            newData.inputDate = date.timeIntervalSince1970
            if moodControl.mood != 0 {
                newData.moodId = moodControl.mood
                enteredNewData = true
            }
            if let weight = Double(weightTextField.text!)  {
                newData.weightValue = weight
                newData.weightUnit = weightUnit.text
                enteredNewData = true
            }
            if let waist = Double(waistTextField.text!) {
                newData.waistValue = waist
                newData.waistUnit = waistUnit.text
                enteredNewData = true
            }
            if enteredNewData {
                momTrackingValues.append(newData)
            }
            
        }
    }
    
    func loadSelectedDateInfo(for date: Date) {
        
        let timeInterval = date.timeIntervalSince1970
        let infoFiltered = momTrackingValues.filter({$0.inputDate == timeInterval})
        
        if infoFiltered.count > 0  {
            moodControl.mood = infoFiltered[0].moodId ?? 0
            weightTextField.text = String(format:"%3.2f", infoFiltered[0].weightValue ?? "")
            if let unit1 = infoFiltered[0].weightUnit {
                weightUnit.text = unit1
            } else {
                weightUnit.text =  ((mom.profileInfo?.preferredMetrics!.contains("kg"))! ? "kg" : "lb")
            }

            waistTextField.text = String(format:"%3.2f", infoFiltered[0].waistValue ?? "")
            if let unit2 = infoFiltered[0].waistUnit {
                waistUnit.text = unit2
            } else {
                waistUnit.text = ((mom.profileInfo?.preferredMetrics!.contains("cm"))! ? "cm" : "in")
            }
            
        } else {
            moodControl.mood = 0
            weightTextField.text = ""
            weightUnit.text =  ((mom.profileInfo?.preferredMetrics!.contains("kg"))! ? "kg" : "lb")
            waistTextField.text = ""
            waistUnit.text = ((mom.profileInfo?.preferredMetrics!.contains("cm"))! ? "cm" : "in")
        }

    }
    
    func dateWasSelected(dateSelected: Date) {
        
        //save previous info
        let previousSelectedDate = weekCalendarControl.getPreviousSelectedDate()
        if (previousSelectedDate != nil) {
            saveDateInfo(for: previousSelectedDate!)
        }
        //load selected date info
        loadSelectedDateInfo(for: dateSelected)
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // User pressed the delete-key to remove a character, this is always valid, return true to allow change
        if string.isEmpty { return true }
        
        // Build the full current string: TextField right now only contains the
        // previous valid value. Use provided info to build up the new version.
        // Can't just concat the two strings because the user might've moved the
        // cursor and delete something in the middle.
        let currentText = textField.text ?? ""
        let replacementText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        // Use our string extensions to check if the string is a valid double and
        // only has the specified amount of decimal places.
        return replacementText.isValidDouble(maxDecimalPlaces: 2)
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("save current data!!!")
    }
 

}
