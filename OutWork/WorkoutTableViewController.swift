//
//  WorkoutTableViewController.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/27/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    
    var workouts = [Workout]()
    let exercises = ["Upper Body Lift", "Lower Body Lift", "Agilities", "Conditioning", "Skill Training", "Group Workout"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load sample data
        loadSampleWorkouts()
    }
    
    func loadSampleWorkouts() {
        var sampleExercises = [true, true, false, true, false, false, false]
        
        let workout1 = Workout(date: "April 4th", time: "4:00pm", duration: 2.1, comment: "N/A", exercises: sampleExercises)
        
        let workout2 = Workout(date: "April 5th", time: "3:00pm", duration: 3, comment: "N/A", exercises: sampleExercises)
        
        sampleExercises[6] = true
        
        let workout3 = Workout(date: "April 6th", time: "2:50pm", duration: 4, comment: "N/A", exercises: sampleExercises)
        
        workouts += [workout1, workout2, workout3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Return the number of rows in the section.
        return workouts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "WorkoutTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! WorkoutTableViewCell
        
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
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
