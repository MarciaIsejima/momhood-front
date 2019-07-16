//
//  SecondViewController.swift
//  momhood3
//
//  Created by laptop on 2019-06-30.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class TrackingViewController: UITableViewController {

    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var waistTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //hides the shadow from navigation bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")

        //show navigation bar
        self.navigationController!.isNavigationBarHidden = false
        //set page title
        navigationItem.title = "Week 16"

        weightTextField.setBottomBorder()
        waistTextField.setBottomBorder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //set left bar button image
        let customButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        customButton.setImage(UIImage.init(named:"calendarBlack"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: customButton)

        
        

    }
}

