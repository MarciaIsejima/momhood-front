//
//  WeekDetailViewController.swift
//  momhood3
//
//  Created by laptop on 2019-07-02.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit


class WeekDetailViewController: UIViewController {

    // MARK: Properties
    
    var week: Week?
    
    @IBOutlet weak var heroView: UIView!
    @IBOutlet weak var weekCountLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var daysToGoLabel: UILabel!
    @IBOutlet weak var fruitImageView: UIImageView!
    
    @IBOutlet weak var babySectionView: UIView!
    @IBOutlet weak var babyTaglineLabel: UILabel!
    @IBOutlet weak var babySizeLabel: UILabel!
    
    @IBOutlet weak var bodyTaglineLabel: UILabel!
    @IBOutlet weak var yourBodySectionView: UIView!
    
    @IBOutlet weak var dietSectionView: UIView!
    @IBOutlet weak var dietTaglineLabel: UILabel!
    
    
    @IBOutlet weak var activitiesSectionView: UIView!
    @IBOutlet weak var activitiesTaglineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let weekCount = "week\(week!.week_count ?? 0)"
        let weekTitle = "Week \(week!.week_count ?? 0)"
        
        if let week = week {
            
            //set page title
            navigationItem.title = weekTitle
            
            //Hero image section
            weekCountLabel.text = weekTitle
            periodLabel.text = week.period
            daysToGoLabel.text = "200 days to go"
            fruitImageView.image = UIImage(named:weekCount)
            heroView.backgroundColor = UIColor.init(rgb: weekColors[week.week_count!])
            
            //Baby section
            babySectionView.layer.borderWidth = 1
            babySectionView.layer.borderColor = UIColor.init(rgb: 0xebebeb).cgColor
            babyTaglineLabel.text = week.baby?.tagline
            babySizeLabel.text = (week.baby?.size)! + " / " + (week.baby?.weight)!
            showArticles(parentView: babySectionView, articles: (week.baby?.articles)!, titleColor: sessionTitleColors["baby"]!, backgroundColor: sessionBkgColors["baby"]!)
            
            //Your body section
            bodyTaglineLabel.text = week.yourbody?.tagline
            yourBodySectionView.backgroundColor = UIColor.init(rgb: sessionBkgColors["yourbody"]!)
            showArticles(parentView: yourBodySectionView, articles: (week.yourbody?.articles)!,titleColor: sessionTitleColors["yourbody"]!, backgroundColor: sessionBkgColors["yourbody"]!)
            
            //Diet section
            dietTaglineLabel.text = week.diet?.tagline
            dietSectionView.backgroundColor = UIColor.init(rgb: sessionBkgColors["diet"]!)
            showArticles(parentView: dietSectionView, articles: (week.diet?.articles)!,titleColor: sessionTitleColors["diet"]!, backgroundColor: sessionBkgColors["diet"]!)
            
            //Activities section
            activitiesTaglineLabel.text = week.activities?.tagline
            activitiesSectionView.backgroundColor = UIColor.init(rgb: sessionBkgColors["activities"]!)
            showArticles(parentView: activitiesSectionView, articles: (week.activities?.articles)!,titleColor: sessionTitleColors["activities"]!, backgroundColor: sessionBkgColors["activities"]!)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //shows navigation bar
        self.navigationController!.isNavigationBarHidden = false
        
    }

    func showArticles(parentView: UIView, articles: [Article], titleColor: Int, backgroundColor: Int){
        
        //set up the single article stack view
        let singleArticleStackView = UIStackView()
        singleArticleStackView.axis = .vertical
        singleArticleStackView.distribution = .fill
        singleArticleStackView.alignment = .fill
        singleArticleStackView.spacing = 0
        
        for article in (articles) {
            
            let titleLabel = UILabel()
            titleLabel.text = article.title
            titleLabel.textColor = UIColor.init(rgb: titleColor)
            titleLabel.font = UIFont(name: "Roboto-bold", size: 18)
            singleArticleStackView.addArrangedSubview(titleLabel)
            
            var content = ""
            for item in article.list! {
                content += "\u{2022}  " + item + "\n"
            }
            let contentTextView = UITextView()
            contentTextView.isScrollEnabled = false
            contentTextView.isEditable = false
            contentTextView.text = content
            contentTextView.textColor = UIColor.init(rgb: 0x333333)
            contentTextView.backgroundColor = UIColor.init(rgb: backgroundColor)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 8
            let attributes = [NSAttributedString.Key.paragraphStyle : style]
            contentTextView.attributedText = NSAttributedString(string: content, attributes: attributes)
            contentTextView.font = UIFont(name: "Roboto-light", size: 16)
            
            singleArticleStackView.addArrangedSubview(contentTextView)
            
        }

        //set up the articles stack view
        let articlesStackView = UIStackView(arrangedSubviews: [singleArticleStackView])
        articlesStackView.axis = .vertical
        articlesStackView.distribution = .fillEqually
        articlesStackView.alignment = .fill
        articlesStackView.spacing = 5
        articlesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        parentView.addSubview(articlesStackView)
        
        //autolayout the stack view - pin 30 up 20 left 20 right 30 down
        let viewsDictionary = ["stackView":articlesStackView]
        let stackView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[stackView]-10-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        let stackView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-90-[stackView]-5-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: viewsDictionary)
        parentView.addConstraints(stackView_H)
        parentView.addConstraints(stackView_V)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
