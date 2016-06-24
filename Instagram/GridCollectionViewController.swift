//
//  GridCollectionViewController.swift
//  Instagram
//
//  Created by joy on 6/19/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

protocol GridCollectionViewControllerDelegate {
    //func controller (controller: GridCollectionViewController, didSelectItem: AnyObject)
    func didTapPicture(image: UIImage, comment: String)
}

let reuseIdentifier = "collectionCellID"

class GridCollectionViewController: UICollectionViewController{
    
    var delegate:GridCollectionViewControllerDelegate?
    
    var samplePhotos = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        samplePhotos = ["1.jpg", "2.jpg", "3.jpg","4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
        collectionView?.reloadData()
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return samplePhotos.count
    }
    
  
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        let image = UIImage(named: samplePhotos[indexPath.row])
        //let image = UIImage(named: usersPosts[indexPath.row]["image"])
        cell.imageView.image = image
        
        return cell
    }
    
    
     func collectionView (collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.frame.width/3.0, collectionView.frame.height/3.0)
        
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //performSegueWithIdentifier("toDetailTableView", sender: self)
        if let image = UIImage(named: samplePhotos[indexPath.row]) {
            self.delegate?.didTapPicture(image, comment: "test comment")
            
        }
        
    }
    
  
    
    
    
    
}
