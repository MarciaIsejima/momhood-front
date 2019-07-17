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
    
    @IBAction func yourBodyButton(_ sender: Any) {
    }
    
    @IBAction func activitiesButton(_ sender: Any) {
    }
    
    @IBAction func dietButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //load Timeline
        loadTimeline()
        
        //load user info
        loadUserInfo()
        
        //load current Week info
        loadCurrentWeek()
    
        //greeting message
        greetingLabel?.text = "Hello \(mom.profileInfo?.name ?? "User")!"
        
        //hero image
        heroImageView?.image=UIImage(named: "week16Hero")
        
        //week count label
        weekCountLabel?.text = "Week \(currentWeek.week_count ?? 0)"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //hide navigation bar on Home page
        self.navigationController!.isNavigationBarHidden = true
//        navigationItem.title = "Timeline"
        
        //period of pregnancy
        periodLabel.text = currentWeek.period
        
        //number of days to go
        daysToGoLabel.text = "200 Days to go"
        
        //Your baby session
        babyViewController.layer.borderWidth = 1
        babyViewController.layer.borderColor = UIColor.init(rgb: 0xebebeb).cgColor
        babyImageView.image=UIImage(named:"babyHome")
        babyTagLine.text = currentWeek.baby?.tagline
        babySizeLabel.text = (currentWeek.baby!.size ?? "") + " / " + (currentWeek.baby!.weight ?? "")
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "ShowYourBodyArticles":
            guard let curWeekArticleViewController = segue.destination as? CurWeekArticleViewController
                else {
                    fatalError("Unexpected destination: \(segue.destination)")
            }
            curWeekArticleViewController.senderButton = "Your Body"
        
        case "ShowDietArticles":
            guard let curWeekArticleViewController = segue.destination as? CurWeekArticleViewController
                else {
                    fatalError("Unexpected destination: \(segue.destination)")
            }
            curWeekArticleViewController.senderButton = "Diet"
            
        case "ShowActivitiesArticles":
            guard let curWeekArticleViewController = segue.destination as? CurWeekArticleViewController
                else {
                    fatalError("Unexpected destination: \(segue.destination)")
            }
            curWeekArticleViewController.senderButton = "Activities"
            
        default:
            return
        }
            
    }

}
