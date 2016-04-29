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
    var email: String
    var lastLogged:String
    var UID: String
    var workoutLog: [Workout]
    var dict: NSDictionary
    
    init(name: String, email: String, lastLogged: String, UID: String, workoutLog: [Workout]) {
        self.name = name
        self.email = email
        self.lastLogged = lastLogged
        self.UID = UID
        self.workoutLog = workoutLog
        self.dict = ["name": name, "email": email, "lastLogged": lastLogged, "UID": UID, "workoutLog": workoutLog]
    }
    
    func initFromUID(uid: String) {
        
    }
    
    // add a workout for this user
    func addWorkout(newWorkout: Workout) {
        self.workoutLog += [newWorkout]
        createDict()
    }
    
    // Create a dictionary user
    func createDict() {
        self.dict = ["name": self.name, "email": self.email, "lastLogged": self.lastLogged, "UID": self.UID, "workoutLog": self.workoutLog]
    }
    
}
