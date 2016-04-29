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
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var NameSignUp: UITextField!
    
    
    var currentUser:OWUser!
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueSignIn") {
            var svc = segue.destinationViewController as! TabBarViewController
            
            svc.currentUser = currentUser
        }
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // Show Alert
    func showAlert(title: String, message: String, button: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: button, style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
    
    // Below: Actions!
    
    @IBAction func pressLogin(sender: UIButton) {
        var ref = Firebase(url: "https://outwork.firebaseio.com/users")
        
        if EmailSignIn.text.isEmpty || PasswordSignIn.text.isEmpty || NameSignUp.text.isEmpty {
            self.showAlert("Invalid Login", message: "You must fill out email, password, (and name for now) to login!", button: "dismiss")
        }
            
        else {
            ref.authUser(EmailSignIn.text, password: PasswordSignIn.text) {
                error, authData in
                if error != nil {
                    self.showAlert("Problem Logging In", message: "An error occured logging in, make sure you entered your email and password correctly!", button: "Dismiss")
                } else {
                    var uid = authData.uid
                    
                }
            }
            
            currentUser = OWUser(name: NameSignUp.text, email: EmailSignIn.text, lastLogged: "Never Logged", UID: "Blah", workoutLog: [])
        }
    }
    
    
    @IBAction func pressSignUp(sender: UIButton) {
        var myRootRef = Firebase(url:"https://outwork.firebaseio.com/users")
        
        if EmailSignIn.text.isEmpty || PasswordSignIn.text.isEmpty || NameSignUp.text.isEmpty {
            self.showAlert("Invalid Signup", message: "You must fill out email, password, and name to sign up!", button: "dismiss")
        }
        
        else {
            myRootRef.createUser(self.EmailSignIn.text, password: self.PasswordSignIn.text,
                withValueCompletionBlock: { error, result in
                    if error != nil {
                        // Error Occured
                        //println("Error Creating account")
                        
                    } else {
                        // Successful Creation
                        let uid = result["uid"] as? String
                        print("Successfully created user account with uid: \(uid)")
                        
                        self.loginAndCreateAfterSignUp(uid!)
                    }
            })
        }
    }
    
    func loginAndCreateAfterSignUp(uid: String) {
        // First Create User
        currentUser = OWUser(name: NameSignUp.text, email: EmailSignIn.text, lastLogged: "Never Logged", UID: uid, workoutLog: [])
        
        // Now Add to Backend
        var myRootRef = Firebase(url:"https://outwork.firebaseio.com/users")
        var user = myRootRef.childByAppendingPath("uid")
        user.setValue(currentUser.dict)
    }
    
}

