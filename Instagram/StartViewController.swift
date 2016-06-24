//
//  StartViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/21/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit
import Firebase

class StartViewController: UIViewController {
    let rootRef = FIRDatabase.database().reference()
    var username : String?
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onLoginAttempt(sender: AnyObject) {
        username = usernameField.text
        let password = passwordField.text
        
        rootRef.child("users").observeSingleEventOfType(.Value) { (snapshot: FIRDataSnapshot) in
            var usersDict : Dictionary<String,AnyObject>?
            usersDict = snapshot.value as! Dictionary<String,AnyObject>
            guard let passwordForAccount = usersDict?[self.username!]?["password"] as? String else{self.failToSignIn();return}
            if (usersDict?.keys.contains(self.username!))! && passwordForAccount == password!{
                    FIRAuth.auth()?.signInWithEmail(self.username!, password: password!, completion: { (user:FIRUser?, error: NSError?) in
                        print("sign-in successful")
                        self.signIn()
                        return
                    })
            }
            else{
                self.failToSignIn()
            }
        }
    }
    
    func signIn(){
        performSegueWithIdentifier("logInSegue", sender: nil)
        //Some sort of segue
    }
    
    func failToSignIn(){
        let alert = UIAlertController(title: "Incorrect Sign-in info", message: "There is no account with this username and password", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CreateAccount"{
            let dvc = segue.destinationViewController as! NewAccountViewController
            dvc.rootRef = self.rootRef
        }
        else if segue.identifier == "logInSegue"{
            let dvc = segue.destinationViewController as! TabViewController
            dvc.username = self.username
        }
    }
    
}
