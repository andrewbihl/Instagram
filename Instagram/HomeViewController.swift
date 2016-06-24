//
//  HomeViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/16/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 10
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeFeedCellID", forIndexPath: indexPath)
        
        return cell
    
    
    }
    
    
    

    
    
    

}
