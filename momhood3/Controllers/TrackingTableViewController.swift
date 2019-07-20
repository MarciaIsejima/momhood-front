//
//  TrackingTableViewController.swift
//  momhood3
//
//  Created by laptop on 2019-07-16.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class TrackingTableViewController: UITableViewController, UITextFieldDelegate {

    
    @IBOutlet weak var weekCalendarControl: WeekCalendarControl!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var weightTextField
    : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.delegate = self
        waistTextField.delegate = self

        //Adding "Done" button to numeric keyboard
        weightTextField.addDoneButtonToKeyboard(myAction:  #selector(self.weightTextField.resignFirstResponder))
        waistTextField.addDoneButtonToKeyboard(myAction:  #selector(self.waistTextField.resignFirstResponder))

        //hides the shadow from navigation bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        //show navigation bar
        self.navigationController!.isNavigationBarHidden = false
        //set page title
        navigationItem.title = "Week \(currentWeek.week_count ?? 0)"
        
        //set page subtitle
        subtitleLabel.text = "\(currentWeek.period ?? "")    \(pregnancy.daysToGo) days to go"

        //format text fields to show only bottom border
        weightTextField.setBottomBorder()
        waistTextField.setBottomBorder()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //set left bar button image
        let customButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        customButton.setImage(UIImage.init(named:"calendarBlack"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: customButton)
        
        //set week calendar first day
        weekCalendarControl.firstDayOfWeek = pregnancy.firstDayOfWeek.last!
        
    }
    
    @IBAction func done (_ sender: UITextField) {
        sender.resignFirstResponder()
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
    
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
