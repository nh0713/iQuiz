//
//  SubjectCell.swift
//  iQuiz
//
//  Created by Nathan Han on 10/30/18.
//  Copyright © 2018 Nathan Han. All rights reserved.
//

import UIKit

class SubjectCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
