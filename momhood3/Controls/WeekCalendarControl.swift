//
//  WeekCalendar.swift
//  momhood3
//
//  Created by laptop on 2019-07-11.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

@IBDesignable class WeekCalendarControl: UIStackView {

    
    //MARK: Properties
    private var dayButtons = [UIButton]()
    private var dateArray = [Date]()
    
    @IBInspectable var firstDayOfWeek = Date() {
        didSet {
            setupButtons()
            selectedDay = selectDefaultDay()
        }
    }
    
    private var selectedDay = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var buttonSize: CGSize = CGSize(width: 50.0, height: 55.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var buttonCount: Int = 7 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(rgb: 0xD385D2)
        //setupDate()
//        setupButtons()
//        selectedDay = selectDefaultDay()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.init(rgb: 0xD385D2)
        
//        //setupDate()
//        setupButtons()
//        selectedDay = selectDefaultDay()
        
    }
    
    //MARK: Button Action
    @objc func dayButtonTapped(button: UIButton) {
        guard let index = dayButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the dayButtons array: \(dayButtons)")
        }
        
        // stores the index of the selected button
        selectedDay = index
        
        
    }
    
    //MARK: public methods
    public func getSelectedDate () -> Date {
        return dateArray[selectedDay]
    }
    
    //MARK: private methods
    private func setupButtons() {
        
        // clear any existing buttons
        for button in dayButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        dayButtons.removeAll()
        dateArray.removeAll()
        
        // Load Button Title styles
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let selectAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Montserrat", size: 22.0)!,
            .foregroundColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.thick.rawValue,
            .paragraphStyle: paragraph,
            ]
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Montserrat Light", size: 22.0)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraph,
            ]
        let disabledAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Montserrat Light", size: 22.0)!,
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraph,
            ]
        let monthSelectAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Montserrat", size: 10.0)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraph,
            ]
        let monthNormalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Montserrat Light", size: 10.0)!,
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraph,
            ]
        let monthDisabledAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Montserrat Light", size: 10.0)!,
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraph,
            ]
        
        for i in 0..<buttonCount {
            
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.init(rgb: 0xd385d2)
            
            //allow multiple lines on button title
            button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
            
            //append the date element on dateArray
            
            var modifiedDate = Calendar.current.date(byAdding: .day, value: i, to: firstDayOfWeek)!
            modifiedDate = Calendar.current.startOfDay(for: modifiedDate)
            print(modifiedDate)
            dateArray.append(modifiedDate)
            
            // Get the day number of the date
            let dayLabel = modifiedDate.day()!
            
            // only shows month label on 1st day of month
            var monthLabel = " "
//            if dayLabel == "01" {
                monthLabel = modifiedDate.month()! + "\n"
//            }
//            var buttonText: NSString = monthLabel + "\n" + dayLabel as NSString
            
            //Set the button styles
            let selectedStyle = NSMutableAttributedString(string: monthLabel, attributes: monthSelectAttributes)
            let daySelectedAttrString = NSAttributedString(string: dayLabel, attributes: selectAttributes)
            selectedStyle.append(daySelectedAttrString)
            button.setAttributedTitle( selectedStyle, for: .selected)
            
            let normalStyle = NSMutableAttributedString(string: monthLabel, attributes: monthNormalAttributes)
            let dayNormalAttrString = NSAttributedString(string: dayLabel, attributes: normalAttributes)
            normalStyle.append(dayNormalAttrString)
            button.setAttributedTitle( normalStyle, for: .normal)
            
            let disabledStyle = NSMutableAttributedString(string: monthLabel, attributes: monthDisabledAttributes)
            let dayDisabledAttrString = NSAttributedString(string: dayLabel, attributes: disabledAttributes)
            disabledStyle.append(dayDisabledAttrString)
            button.setAttributedTitle( disabledStyle, for: .disabled)
            
            // If date is in the future, disable button
            if modifiedDate > Date() {
                button.isEnabled = false
            }
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(WeekCalendarControl.dayButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            dayButtons.append(button)
        }
        
        updateButtonSelectionStates()
        
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in dayButtons.enumerated() {
            // If one button is selected, the others whould be unselected
            button.isSelected = (index == selectedDay)

        }
    }
    
    private func selectDefaultDay() -> Int {
        var selectedDayIndex = 0
        for (index, date) in dateArray.enumerated() {
            if date == Calendar.current.startOfDay(for: Date()) {
                selectedDayIndex = index
            }
        }
        return selectedDayIndex
    }
    
    func setupDate() {
        let dateString = "08-07-2019"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateFromString = dateFormatter.date(from: dateString)
        firstDayOfWeek = dateFromString!
        
    }
    
}
/*
// Only override draw() if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
override func draw(_ rect: CGRect) {
    // Drawing code
}
*/


