//
//  WeekCell.swift
//  momhood3
//
//  Created by laptop on 2019-07-01.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class WeekTableViewCell: UITableViewCell {

    
    //MARK: Properties
    @IBOutlet weak var weekCountLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var sizeOfBabyLabel: UILabel!
    @IBOutlet weak var fruitImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
}
