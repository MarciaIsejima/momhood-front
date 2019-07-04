//
//  FirstViewController.swift
//  momhood3
//
//  Created by laptop on 2019-06-30.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var weekCountLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var daysToGoLabel: UILabel!
    @IBOutlet weak var babyImageView: UIImageView!
    @IBOutlet weak var babyViewController: UIView!
    @IBOutlet weak var babySizeLabel: UILabel!
    
    @IBOutlet weak var babyTagLine: UILabel!
    
    //MARK: Actions
    @IBAction func timelineButton(_ sender: UIButton) {
        
    }
    
    @IBAction func shareButton(_ sender: UIButton) {
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //load Timeline
        loadTimeline()
    
        //greeting message
        greetingLabel?.text = "Good Morning Katie!"
        
        //hero image
        heroImageView?.image=UIImage(named: "week16Hero")
        
        //week count label
        weekCountLabel?.text = "Week 16"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //hide navigation bar on Home page
        self.navigationController!.isNavigationBarHidden = true
//        navigationItem.title = "Timeline"
        
        //period of pregnancy
        periodLabel.text = "2nd trimester"
        
        //number of days to go
        daysToGoLabel.text = "200 Days to go"
        
        //Your baby session
        
        babyViewController.layer.borderWidth = 1
        //babyViewController.layer.borderColor = UIColor.lightGray.cgColor
        babyViewController.layer.borderColor = UIColor.init(rgb: 0xebebeb).cgColor
        //F1F8F8
        babyImageView.image=UIImage(named:"babyHome")
        
            babyTagLine.text = "Baby's First Hiccups Ahead!"

            babySizeLabel.text = "10 - 13cm/0.09 - 0.11kg"
    }

}
