//
//  TeamPageViewController.swift
//  OutWork
//
//  Created by Alexander Lee on 4/28/16.
//  Copyright © 2016 OutWorkDev. All rights reserved.
//

import UIKit

class TeamPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TopFiveField: UITextView!
    @IBOutlet weak var BottomFiveField: UITextView!
    @IBOutlet weak var TeamFeed: UITableView!
    
    // Holds Workouts
    var workouts = [Workout]()
    let exercisesArray = ["Upper Body Lift", "Lower Body Lift", "Conditioning", "Agilities",  "Skill Training", "Group Workout"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TopFiveField.text = "1) Matt O'Connor\n2) Ryan Ambler\n3) Luke Brugger\n4) Bobby Weaver\n5) Austin DeButts"
        
        self.BottomFiveField.text = "1) Jack O'Brien\n2) Riley Thompson\n3) Dawson Mackenzie\n4) Zach Currier\n5) Mikey Macdonald"
        
        loadSampleWorkouts()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Function to Load Sample Data
    func loadSampleWorkouts() {
        var sampleExercises = [true, true, false, true, false, false, false]
        
        let workout1 = Workout(date: "Matt O'Connor", time: "4:00pm", duration: 2.1, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[0] = false
        
        print(workout1.toString())
        
        let workout2 = Workout(date: "Alistair Berven", time: "3:00pm", duration: 3.2, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[5] = true
        
        let workout3 = Workout(date: "Bear Altemus", time: "2:50pm", duration: 4.2, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[2] = false
        
        let workout4 = Workout(date: "Siera Goldstien", time: "2:50pm", duration: 4.3, comment: "N/A", exercises: sampleExercises)
        
        print(workout4.toString())
        
        let workout5 = Workout(date: "Austin DeButts", time: "2:40 pm", duration: 2.5, comment: "N/A", exercises: sampleExercises)
        
        let workout6 = Workout(date: "Austin Sims", time: "2:40 pm", duration: 4.2, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[1] = false;
        
        let workout7 = Workout(date: "Bobby Weaver", time: "2:30", duration: 1.6, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[1] = true;
        sampleExercises[5] = false;
        
        let workout8 = Workout(date: "Ryan Ambler", time: "2:20", duration: 2.5, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[1] = false;
        
        let workout9 = Workout(date: "Gavin McBride", time: "2:40", duration: 2.3, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[0] = true;
        
        let workout10 = Workout(date: "Luke Brugger", time: "2:40", duration: 3.5, comment: "N/A", exercises: sampleExercises)
        
        workouts = [workout1, workout2, workout3, workout4, workout5, workout6, workout7, workout8, workout9,workout10]
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
        
        let cell = self.TeamFeed.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! WorkoutTableViewCell
        
        let workout = workouts[indexPath.row]
        
        cell.DateLabel.text = "\(workout.date)"
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
