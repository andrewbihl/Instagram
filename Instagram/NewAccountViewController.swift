//
//  NewAccountViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/22/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit
import Firebase

class NewAccountViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    var rootRef: FIRDatabaseReference?
    var accountValuesTaken : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func entriesAreValid() -> (isValid:Bool, issueMessage:String){
        if  firstNameField.text == nil ||
            usernameField.text == nil ||
            passwordField.text == nil ||
            emailField.text == nil {
            return (false, "Fields must all contain text")
        }
        if  firstNameField.text == "" ||
            usernameField.text == "" ||
            passwordField.text == "" ||
            emailField.text == "" {
            return (false, "Fields must all contain text")
        }
        if (usernameField.text!.containsString(" ") ||
            emailField.text!.containsString(" ") ||
            passwordField.text!.containsString(" ")) {
            return (false,"Only first name field can contain spaces")
        }
        if (passwordField.text != confirmPasswordField.text){
            return (false,"Password fields do not match")
        }
        return (true, "No issues found")
    }
    
    func createAccount(){
        var newUser = Dictionary<String,AnyObject>()
        newUser.updateValue(emailField.text!, forKey: "email")
        newUser.updateValue(firstNameField.text!, forKey: "firstName")
        newUser.updateValue(passwordField.text!, forKey: "password")
        rootRef?.child("users").child(usernameField.text!).setValue(newUser)
    }
    
    @IBAction func onCreateTapped(sender: AnyObject) {
        
        let validityCheck = entriesAreValid()
        if (!validityCheck.isValid){
            let alert = UIAlertController(title: "Invalid Inputs", message: validityCheck.issueMessage, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            rootRef?.child("users").observeSingleEventOfType(.Value, withBlock: { (snapshot: FIRDataSnapshot) in
                guard let usersDict = snapshot.value as? NSDictionary else{
                    return
                }
                for username in usersDict.allKeys{
                    if username as? String == self.usernameField.text{
                        let alert = UIAlertController(title: "Invalid Inputs", message: "Username is taken.", preferredStyle: .Alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                        return
                    }
                    else{
                        let user = usersDict[username as! String] as! NSDictionary
                        if user["email"] as? String == self.emailField.text{
                            let alert = UIAlertController(title: "Invalid Inputs", message: "Username is taken.", preferredStyle: .Alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
                            self.presentViewController(alert, animated: true, completion: nil)
                            return
                        }
                    }
                }
                print("Account values are valid")
                self.createAccount()
                self.performSegueWithIdentifier("logInSegue", sender: nil)
            })
        }
        
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
