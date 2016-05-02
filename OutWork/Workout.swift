//
//  Workout.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/27/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit



struct PropertyKey {
    static let dateKey = "date"
    static let timeKey = "time"
    static let durationKey = "duration"
    static let commentKey = "comment"
    static let exercisesKey = "exercises"
}

class Workout: NSObject, NSCoding {
    // MARK: Properties
    
    var date: String
    var time: String
    var duration: Float
    var comment: String
    var exercises: [Bool] = [false, false, false, false, false, false]
    
    let exercisesArray = ["Upper Body Lift", "Lower Body Lift", "Conditioning", "Agilities",  "Skill Training", "Group Workout"]
    
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
    
    // NOT FINISHED
    // encode for storage
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(date, forKey: PropertyKey.dateKey)
        aCoder.encodeObject(time, forKey: PropertyKey.timeKey)
        aCoder.encodeFloat(duration, forKey: PropertyKey.durationKey)
        aCoder.encodeObject(comment, forKey: PropertyKey.commentKey)
        //aCoder.encode()
    }
    
    // NOT FINISHED
    // reload from storage
    required init(coder aDecoder: NSCoder) {
        self.date = ""
        self.time = ""
        self.duration = 1.0
        self.comment = ""
        self.exercises = [false]
    }
    
    // Create a coherent string of workout
    func toString() -> String {
        let durationText = NSString(format: "%.1f", self.duration) as String
        
        var message = "\(self.date) at \(self.time).\n You trained for \(durationText) hours"
        
        var exercisesText = " and completed the following exercises:\n"
        var first = true
        for i in 0...5 {
            if self.exercises[i] {
                if first {
                    exercisesText += exercisesArray[i]
                    first = false
                }
                else {
                    exercisesText += "\n" + exercisesArray[i]
                }
            }
        }
        
        message += exercisesText
        
        message += "\n Specifics: " + comment
        
        return message
    }
}

