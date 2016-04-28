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
    @IBOutlet weak var nameTeam: UILabel!
    @IBOutlet weak var nameSport: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
