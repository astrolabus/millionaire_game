//
//  StatisticsScreenCell.swift
//  billionaire_game
//
//  Created by Полина Войтенко on 03.09.2020.
//  Copyright © 2020 Полина Войтенко. All rights reserved.
//

import UIKit

class StatisticsScreenCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
