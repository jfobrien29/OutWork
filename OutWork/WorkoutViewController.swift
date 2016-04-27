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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
}
