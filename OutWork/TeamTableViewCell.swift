//
//  TeamTableViewCell.swift
//  OutWork
//
//  Created by Alexander Lee on 4/27/16.
//  Copyright © 2016 OutWorkDev. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sport: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
