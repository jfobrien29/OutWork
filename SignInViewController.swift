//
//  SignInViewController.swift
//  OutWork
//
//  Created by Jack O'Brien on 4/26/16.
//  Copyright (c) 2016 OutWorkDev. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a reference to a Firebase location
        var myRootRef = Firebase(url:"https://outtrain.firebaseio.com")
        // Write data to Firebase
        myRootRef.setValue("Do you have data? You'll love Firebase.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

