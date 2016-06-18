//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/16/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var listVC: UIViewController?
    var mapVC: UIViewController?
    var lastVC: UIViewController?
    var gridVC: UIViewController?
    
    override func viewDidLoad() {
        //        reference to storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        listVC = storyboard.instantiateViewControllerWithIdentifier("imageListVC")
        mapVC = storyboard.instantiateViewControllerWithIdentifier("mapVC")
        lastVC = storyboard.instantiateViewControllerWithIdentifier("lastVC")
        
        gridVC = storyboard.instantiateViewControllerWithIdentifier("gridVC")
        showGrid()
    }

    
    func swapContainerChildView (vc: UIViewController?) {
        //         listVC is an optional, so we cannot grab its view if it's nil (i.e. doesn't exist) -- .addSubview requires a non-optional to be passed in
        for viewItem in containerView.subviews {
            viewItem.removeFromSuperview()
        }
        
        if let vc = vc {
            containerView.addSubview(vc.view)
        }
    }
    
    @IBAction func showGrid() {
        //       Show the grid, remove existing view from containerView, add view from gridViewController to containerView
        swapContainerChildView(gridVC)
        print("Grid Button pressed")
    }
    
    @IBAction func showList(sender: AnyObject) {
        swapContainerChildView(listVC)
        print("List Button pressed")
    }
    
    @IBAction func showMap(sender: AnyObject) {
        //       Show the map, remove existing viewController from containerView, add view from mapViewController to containerView
        swapContainerChildView(mapVC)
        print("Map Button pressed")
    }
    
    @IBAction func showLast(sender: AnyObject) {
        //       Show the lastView, remove existing viewController from containerView, add view from lastViewController to containerView
        swapContainerChildView(lastVC)
        
        print("Last Button pressed")
    }
    
    
    
}
