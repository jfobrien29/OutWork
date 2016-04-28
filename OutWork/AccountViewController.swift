//
//  AccountViewController.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/26/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var WorkoutHistory: UITableView!
    
    // Holds Workouts
    var workouts = [Workout]()
    let exercisesArray = ["Upper Body Lift", "Lower Body Lift", "Conditioning", "Agilities",  "Skill Training", "Group Workout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadSampleWorkouts()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Function to Load Sample Data
    func loadSampleWorkouts() {
        var sampleExercises = [true, true, false, true, false, false, false]
        
        let workout1 = Workout(date: "April 4th", time: "4:00pm", duration: 2.1, comment: "N/A", exercises: sampleExercises)
        
        let workout2 = Workout(date: "April 5th", time: "3:00pm", duration: 3.2, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[6] = true
        
        let workout3 = Workout(date: "April 6th", time: "2:50pm", duration: 4.2, comment: "N/A", exercises: sampleExercises)
        
        workouts = [workout1, workout2, workout3]
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return workouts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "WorkoutTableViewCell"
        
        let cell = self.WorkoutHistory.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! WorkoutTableViewCell
        
        let workout = workouts[indexPath.row]
        
        cell.DateLabel.text = "\(workout.date) at \(workout.time)"
        cell.DurationLabel.text = "Duration: \(workout.duration)"
        
        // Set Exercises
        var exerciseText = "Exercises: "
        var first = true
        for i in 1...6 {
            if workout.exercises[i-1] {
                if first {
                    exerciseText += exercisesArray[i-1]
                    first = false
                }
                else {
                    exerciseText += ", " + exercisesArray[i-1]
                }
            }
        }
        
        cell.ExercisesLabel.text = exerciseText
        
        return cell
    }
    
    

    
}