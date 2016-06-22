//
//  MediaItem.swift
//  Instagram
//
//  Created by joy on 6/20/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class MediaItem: NSObject {
    
    let photo = UIImage(named:"4")
    var comments = ["adscnsd", "asndklncad", "asdcnklns"]
    let byline: String?
    let timePosted: String?
    let like: String?
    
    init(comments: [String], byline: String?, timePosted: String?, like: String?){
//        self.photo = photo
        self.byline = byline
        self.comments = comments
        self.timePosted = timePosted
        self.like = like
    }
    
    
    
}
