//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/16/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, GridCollectionViewControllerDelegate {
    
    @IBOutlet weak var containerView: UIView!
    
    var listVC: UIViewController?
    var mapVC: UIViewController?
    var lastVC: UIViewController?
    var gridVC: GridCollectionViewController?
    
    var commentForDetailView: String?
    var imageForDetailView: UIImage?
    
    override func viewDidLoad() {
        //        reference to storyboard
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        listVC = storyboard.instantiateViewControllerWithIdentifier("imageListVC")
        mapVC = storyboard.instantiateViewControllerWithIdentifier("mapVC")
        lastVC = storyboard.instantiateViewControllerWithIdentifier("lastVC")
        gridVC = storyboard.instantiateViewControllerWithIdentifier("gridVC") as! GridCollectionViewController
        gridVC!.delegate = self
        showGrid()
        
    }
    
    
    //    func controller(controller: GridCollectionViewController, didSelectItem: AnyObject) {
    //        print("A picture was tapped")
    //    }
    
    func didTapPicture(image: UIImage, comment: String) {
        
        commentForDetailView = comment
        imageForDetailView = image
        performSegueWithIdentifier("toDetailTableView", sender: nil)
       
        print("Picture was tapped at \(image)")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailTableView" {
            let svc = segue.destinationViewController as! DetailTableViewController
            svc.this = commentForDetailView
            svc.that = imageForDetailView
        }
    }
    
    func swapContainerChildView (vc: UIViewController?) {
        //  listVC is an optional, so we cannot grab its view if it's nil (i.e. doesn't exist) -- .addSubview requires a non-optional to be passed in
        for viewItem in containerView.subviews {
            viewItem.removeFromSuperview()
        }
        if let vc = vc {
            vc.view.frame = CGRectMake(0, 0, containerView.frame.width, containerView.frame.height)
            containerView.addSubview(vc.view)
        }
    }
    
    @IBAction func showGrid() {
        // Show the grid, remove existing view from containerView, add view from gridViewController to containerView
        swapContainerChildView(gridVC)
        print("Grid Button pressed")
    }
    
    @IBAction func showList(sender: AnyObject) {
        // Show the list, remove existing view from containerView, add view from listViewController to containerView
        swapContainerChildView(listVC)
        print("List Button pressed")
    }
    
    @IBAction func showMap(sender: AnyObject) {
        // Show the map, remove existing viewController from containerView, add view from mapViewController to containerView
        swapContainerChildView(mapVC)
        print("Map Button pressed")
    }
    
    @IBAction func showLast(sender: AnyObject) {
        // Show the lastView, remove existing viewController from containerView, add view from lastViewController to containerView
        swapContainerChildView(lastVC)
        print("Last Button pressed")
    }
    
    
    
}
