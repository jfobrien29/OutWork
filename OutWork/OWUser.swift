//
//  OWUser.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/28/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class OWUser: NSObject {
    // properties
    
    var name: String
    var UID: String
    var workoutLog: [Workout]
    
    init(name: String, UID: String, workoutLog: [Workout]) {
        self.name = name
        self.UID = UID
        self.workoutLog = workoutLog
    }
}
