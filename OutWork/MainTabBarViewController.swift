//
//  TabBarViewController.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/29/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    var currentUser:OWUser!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUser() -> OWUser {
        return currentUser
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
