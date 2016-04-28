//
//  DisplayTeam.swift
//  OutWork
//
//  Created by Alexander Lee on 4/28/16.
//  Copyright © 2016 OutWorkDev. All rights reserved.
//

import UIKit

class DisplayTeam {
    // MARK: Properties
    
    var name: String
    var sport: String
    var logo: UIImage
    
    
    // MARK: Initialization
    
    init(name: String, sport: String, logo: UIImage) {
        // Initialize stored properties.
        self.name = name
        self.sport = sport
        self.logo = logo
    }
}