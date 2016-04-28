//
//  WorkoutViewController.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/26/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController {
    @IBOutlet weak var UpperBodyLiftButton: UIButton!
    @IBOutlet weak var LowerBodyLiftButton: UIButton!
    @IBOutlet weak var ConditioningButton: UIButton!
    @IBOutlet weak var AgilitiesTrainingButton: UIButton!
    @IBOutlet weak var SkillTrainingButton: UIButton!
    @IBOutlet weak var GroupTrainingButton: UIButton!

    @IBOutlet weak var TimeSlider: UISlider!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var SpecificText: UITextField!
    
    var exercises = [UIButton]()
    let exercisesArray = ["Upper Body Lift", "Lower Body Lift", "Conditioning", "Agilities",  "Skill Training", "Group Workout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        exercises = [UpperBodyLiftButton, LowerBodyLiftButton, ConditioningButton, AgilitiesTrainingButton, SkillTrainingButton, GroupTrainingButton]
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        // Set all backgrounds to white
        for b in exercises {
            b.backgroundColor = UIColor.whiteColor()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func ButtonSelection(sender: UIButton) {
        if (sender.backgroundColor == UIColor.whiteColor()) {
            sender.backgroundColor = UIColor(red: 1.0, green: 0.63685943749999996, blue: 0.28715672549999999, alpha: 1)
        }
        else {
            sender.backgroundColor = UIColor.whiteColor()
        }
    }
    @IBAction func SliderAction(sender: UISlider) {
        TimeLabel.text = NSString(format: "I worked out for: %.1f hours", TimeSlider.value) as String
    }
    
    @IBAction func LogButtonClick(sender: UIButton) {
        var exerciseArray = [Bool]()
        var noExercises = true
        
        // Find what exercises completed and set to white
        for b in exercises {
            if b.backgroundColor != UIColor.whiteColor() {
                exerciseArray += [true]
                b.backgroundColor = UIColor.whiteColor()
                noExercises = false
            }
            else {
                exerciseArray += [false]
            }
        }
        
        var title = "Log Successful!"
        var message = ""
        
        if noExercises == true || TimeSlider.value == 0.0 {
            
            title = "Invalid Log"
            message = "You must select one exercise and have a duration greater than 0!"
        }
        else {
            var newLog = Workout(date: "April 28th", time: "2:00pm", duration: TimeSlider.value, comment: SpecificText.text, exercises: exerciseArray)
            
            // Reset Time Slider
            TimeSlider.value = 1.0
            TimeLabel.text = "I worked out for: 1.0 hours"
            
            var durationText = NSString(format: "%.1f", newLog.duration) as String
            
            message = "Workout logged for \(newLog.date) at \(newLog.time).\n You trained for \(durationText) hours"
            
            var exercisesText = " and completed the following exercises:\n"
            var first = true
            for i in 0...5 {
                if newLog.exercises[i] {
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
            
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}


