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
    
    // Properties
    @IBOutlet weak var EmailSignIn: UITextField!
    @IBOutlet weak var PasswordSignIn: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var ResetPasswordButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var NameSignUp: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a reference to a Firebase location
        var myRootRef = Firebase(url:"https://outwork.firebaseio.com")
        // Write data to Firebase
        var date = NSDate()
        myRootRef.setValue(["Sample Data": NSDate().description])
        
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
    
    // Below: Actions!
    
    @IBAction func pressResetPassword(sender: UIButton) {
        let ref = Firebase(url: "https://outwork.firebaseio.com")
        ref.resetPasswordForUser(EmailSignIn.text, withCompletionBlock: { error in
            
            if error != nil {
                // There was an error processing the request
            } else {
                // Password reset sent successfully
            }
        })
        
    }
    
    @IBAction func pressSignUp(sender: UIButton) {
        var myRootRef = Firebase(url:"https://outwork.firebaseio.com")
        
        myRootRef.createUser(EmailSignIn.text, password: PasswordSignIn.text,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // Error Occured
                    //println("Error Creating account")
                    
                } else {
                    // Successful Creation
                    let uid = result["uid"] as? String
                    //println("Successfully created user account with uid: \(uid)")
                }
        })
    }
    
}

