//
//  MediaItemTableViewCell.swift
//  Instagram
//
//  Created by joy on 6/20/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class MediaItemTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    var someObject:MediaItem = MediaItem(comments: [], byline: "moreText", timePosted: "andThen", like: "liked")
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var usernameAndCaptionLabel: UILabel!
    @IBOutlet var commentLabel: UILabel?
    @IBOutlet var subheading: UILabel?
    @IBOutlet var timeStamp: UILabel?
    
    
    @IBOutlet var commentsTableView: UITableView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        photoImageView.image = someObject.photo
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("commentCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = someObject.comments[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        
        
        return someObject.comments.count
    }
    
   

    

}
