//
//  MoodControl.swift
//  momhood3
//
//  Created by laptop on 2019-07-10.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

@IBDesignable class MoodControl: UIStackView {
    
    //MARK: Properties
    private var moodButtons = [UIButton]()
    
    var mood = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var faceSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var faceCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

    //MARK: initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func moodButtonTapped(button: UIButton) {
        guard let index = moodButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the moodButtons array: \(moodButtons)")
        }
        
        // Calculate the mood rate of the selected button
        let selectedRating = index + 1
        
        if selectedRating == mood {
            // If the selected mood represents the current rating, reset the rating to 0.
            mood = 0
        } else {
            // Otherwise set the rating to the selected mood
            mood = selectedRating
        }
    }
    
    //MARK: private methods
    private func setupButtons() {
        
        // clear any existing buttons
        for button in moodButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        moodButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        //excited
        let selectedExcited = UIImage(named: "excited", in: bundle, compatibleWith: self.traitCollection)
        let unselectedExcited = UIImage(named:"excited_stroke", in: bundle, compatibleWith: self.traitCollection)
        let highlightedExcited = UIImage(named:"excited_stroke", in: bundle, compatibleWith: self.traitCollection)
        //lovely
        let selectedLovely = UIImage(named: "lovely", in: bundle, compatibleWith: self.traitCollection)
        let unselectedLovely = UIImage(named:"lovely_stroke", in: bundle, compatibleWith: self.traitCollection)
        let highlightedLovely = UIImage(named:"lovely_stroke", in: bundle, compatibleWith: self.traitCollection)
        //happy
        let selectedHappy = UIImage(named: "happy", in: bundle, compatibleWith: self.traitCollection)
        let unselectedHappy = UIImage(named:"happy_stroke", in: bundle, compatibleWith: self.traitCollection)
        let highlightedHappy = UIImage(named:"happy_stroke", in: bundle, compatibleWith: self.traitCollection)
        //neutral
        let selectedNeutral = UIImage(named: "neutral", in: bundle, compatibleWith: self.traitCollection)
        let unselectedNeutral = UIImage(named:"neutral_stroke", in: bundle, compatibleWith: self.traitCollection)
        let highlightedNeutral = UIImage(named:"neutral_stroke", in: bundle, compatibleWith: self.traitCollection)
        //sad
        let selectedSad = UIImage(named: "sad", in: bundle, compatibleWith: self.traitCollection)
        let unselectedSad = UIImage(named:"sad_stroke", in: bundle, compatibleWith: self.traitCollection)
        let highlightedSad = UIImage(named:"sad_stroke", in: bundle, compatibleWith: self.traitCollection)
        
        for i in 0..<faceCount {
            // Create the button
            let button = UIButton()
            
            // Set the button images
            switch i {
                
            case 0:
                button.setImage(unselectedSad, for: .normal)
                button.setImage(selectedSad, for: .selected)
                button.setImage(highlightedSad, for: .highlighted)
                button.setImage(highlightedSad, for: [.highlighted, .selected])
            case 1:
                button.setImage(unselectedNeutral, for: .normal)
                button.setImage(selectedNeutral, for: .selected)
                button.setImage(highlightedNeutral, for: .highlighted)
                button.setImage(highlightedNeutral, for: [.highlighted, .selected])
            case 2:
                button.setImage(unselectedHappy, for: .normal)
                button.setImage(selectedHappy, for: .selected)
                button.setImage(highlightedHappy, for: .highlighted)
                button.setImage(highlightedHappy, for: [.highlighted, .selected])
            case 3:
                button.setImage(unselectedLovely, for: .normal)
                button.setImage(selectedLovely, for: .selected)
                button.setImage(highlightedLovely, for: .highlighted)
                button.setImage(highlightedLovely, for: [.highlighted, .selected])
            case 4:
                button.setImage(unselectedExcited, for: .normal)
                button.setImage(selectedExcited, for: .selected)
                button.setImage(highlightedExcited, for: .highlighted)
                button.setImage(highlightedExcited, for: [.highlighted, .selected])
                
            default:
                button.setImage(unselectedHappy, for: .normal)
                button.setImage(selectedExcited, for: .selected)
                button.setImage(highlightedExcited, for: .highlighted)
                button.setImage(highlightedExcited, for: [.highlighted, .selected])

            }

            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: faceSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: faceSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(MoodControl.moodButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            moodButtons.append(button)
        }
        
        updateButtonSelectionStates()
        
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in moodButtons.enumerated() {
            // If one button is selected, the others whould be unselected
            button.isSelected = (index+1 == mood)
        }
    }
    
}
