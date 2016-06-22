//
//  CameraViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/16/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    let popoverPresenter = UIPopoverPresentationController(
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func onVideoSelected(sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.sourceType = .Camera
        picker.cameraCaptureMode = .Video
        picker.delegate = self
        picker.allowsEditing = true
        picker.modalPresentationStyle = .FullScreen
        presentViewController(picker, animated: true, completion: nil)
        let popoverPresenter = picker.popoverPresentationController
        popoverPresenter?.sourceView = imageView
        popoverPresenter?.sourceRect = imageView.frame
    }
    
    @IBAction func onPhotoSelected(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = .Camera
        picker.cameraCaptureMode = .Photo
        picker.delegate = self
        picker.allowsEditing = true
        picker.modalPresentationStyle = .FullScreen
        presentViewController(picker, animated: true, completion: nil)
        let popoverPresenter = picker.popoverPresentationController
        popoverPresenter?.sourceView = imageView
        popoverPresenter?.sourceRect = imageView.frame
    }

    @IBAction func onLibrarySelected(sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.sourceType = .PhotoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        picker.modalPresentationStyle = .FullScreen
        presentViewController(picker, animated: true, completion: nil)
        let popoverPresenter = picker.popoverPresentationController
        popoverPresenter?.sourceView = imageView
        popoverPresenter?.sourceRect = imageView.frame
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Image or Video selected")
        print(info.values)
    }

    override func viewDidLoad() {
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {

    }

    
}
    