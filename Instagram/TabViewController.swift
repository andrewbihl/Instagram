//
//  TabViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/22/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit
import Firebase

class TabViewController: UITabBarController {

    var username : String?

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.viewControllers = [self]
//        self.parentViewController?.navigationController
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.view.window?.rootViewController = self
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
