//
//  TeamPageViewController.swift
//  OutWork
//
//  Created by Alexander Lee on 4/28/16.
//  Copyright © 2016 OutWorkDev. All rights reserved.
//

import UIKit

class TeamPageViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var TopFiveField: UITextView!
    @IBOutlet weak var BottomFiveField: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TopFiveField.text = "Matt O'Connor \n 2)Ryan Ambler \n 3)Luke Brugger \n 4)Bobby Weaver \n 5)Austin DeButts"
        
        self.BottomFiveField.text = "Jack O'Brien \n 2)Riley Thompson \n 3)Dawson Mackenzie \n 4)Zach Currier \n 5)Mikey Macdonald"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
