//
//  Workout.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/27/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class Workout {
    // MARK: Properties
    
    var date: String
    var time: String
    var duration: Float
    var comment: String
    var exercises: [Bool] = [false, false, false, false, false, false, false]
    
    
    
    // MARK: Initialization
    
    init(date: String, time: String, duration: Float, comment: String, exercises: [Bool]) {
        // Initialize stored properties.
        self.date = date
        self.time = time
        self.duration = duration
        self.comment = comment
        self.exercises = exercises
        
        /*
        // Initialization should fail if there is no duration or exercises
        if duration == 0 || exercises[0] == false {
            return nil
        }
        */
    }
}

