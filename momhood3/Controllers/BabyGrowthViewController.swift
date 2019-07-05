//
//  BabyGrowthViewController.swift
//  momhood3
//
//  Created by laptop on 2019-07-04.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class BabyGrowthViewController: UIViewController {

    
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var babySizeView: UIView!
    
    @IBOutlet weak var babyTaglineLabel: UILabel!
    @IBOutlet weak var babySizeLabel: UILabel!
    @IBOutlet weak var babyFruitLabel: UILabel!
    @IBOutlet weak var babyFruitImageView: UIImageView!
    
    @IBOutlet weak var articlesSessionView: UIView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            
            //hides the shadow from navigation bar
            self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
            subtitleLabel.textAlignment = .center;
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            
            //shows navigation bar
            self.navigationController!.isNavigationBarHidden = false
            self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(rgb: 0x333333)]
            navigationItem.title = "Baby Growth"
            
           
                
            //subtitle
            subtitleLabel.text = "Week \(currentWeek.week_count ?? 0)   \(currentWeek.period ?? "")"
            
            //baby size info session
            babySizeView.backgroundColor = UIColor.init(rgb: weekColors[currentWeek.week_count!])
            babyTaglineLabel.text = currentWeek.baby!.tagline
            let sizeAndWeight = currentWeek.baby!.size! + " / " + currentWeek.baby!.weight!
            babySizeLabel.text = sizeAndWeight
            babyFruitLabel.text = "Your baby if of the size of \(currentWeek.baby!.fruitsize ?? "")"
            babyFruitImageView.image = UIImage(named: "week\(currentWeek.week_count ?? 0)")
            
            //articles session
            showArticles()

            
        }
        
        func showArticles(){
            
            //set up the single article stack view
            let singleArticleStackView = UIStackView()
            singleArticleStackView.axis = .vertical
            singleArticleStackView.distribution = .fill
            singleArticleStackView.alignment = .fill
            singleArticleStackView.spacing = 15
            
            for article in (currentWeek.baby!.articles!) {
                
                let articleImage = UIImageView()
                if let image = article.imageurl {
                    articleImage.downloaded(from: image)
                } else {
                    articleImage.image = UIImage(named: "babyGrowth")
                }
                singleArticleStackView.addArrangedSubview(articleImage)
                
                let titleLabel = UILabel()
                titleLabel.text = article.title
                titleLabel.textColor = UIColor.init(rgb: 0x33333)
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
                //            contentTextView.backgroundColor = UIColor.init(rgb: backgroundColor)
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
            
            articlesSessionView.addSubview(articlesStackView)
            
            //autolayout the stack view
            let viewsDictionary = ["stackView":articlesStackView]
            let stackView_H = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[stackView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
            let stackView_V = NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[stackView]-5-|", options: NSLayoutConstraint.FormatOptions(rawValue:0), metrics: nil, views: viewsDictionary)
            articlesSessionView.addConstraints(stackView_H)
            articlesSessionView.addConstraints(stackView_V)
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
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
