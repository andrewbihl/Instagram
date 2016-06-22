//
//  ListViewController.swift
//  Instagram
//
//  Created by joy on 6/18/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listViewID", forIndexPath: indexPath) as! MediaItemTableViewCell
        
        let item = MediaItem(comments:["blah blah blah"], byline: "moreText", timePosted: "andThen", like: "liked")
//
        cell.someObject = item
        
//        cell.imageView?.image = item.photo
        
//        cell.commentLabel?.text = item.comments
//        cell.commentLabel?.numberOfLines = 0
        
        cell.subheading?.text = item.byline
        cell.subheading?.numberOfLines = 0
        
        
        
        return cell
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
