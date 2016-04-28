//
//  WorkoutTableViewCell.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/27/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    // Properties
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DurationLabel: UILabel!
    @IBOutlet weak var ExercisesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
