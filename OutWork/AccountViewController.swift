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
    let exercises = ["Upper Body Lift", "Lower Body Lift", "Agilities", "Conditioning", "Skill Training", "Group Workout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadSampleWorkouts()
        
        print("Reached this line")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Function to Load Sample Data
    func loadSampleWorkouts() {
        var sampleExercises = [true, true, false, true, false, false, false]
        
        let workout1 = Workout(date: "April 4th", time: "4:00pm", duration: 2.1, comment: "N/A", exercises: sampleExercises)
        
        let workout2 = Workout(date: "April 5th", time: "3:00pm", duration: 3, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[6] = true
        
        let workout3 = Workout(date: "April 6th", time: "2:50pm", duration: 4, comment: "N/A", exercises: sampleExercises)
        
        workouts += [workout1, workout2, workout3]
        
        print("workouts loaded")
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        print(workouts.count)
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
        for i in 1...6 {
            if workout.exercises[i] {
                exerciseText += ", " + exercises[i]
            }
        }
        
        cell.ExercisesLabel.text = exerciseText
        print(exerciseText)
        
        return cell
    }
    
    

    
}