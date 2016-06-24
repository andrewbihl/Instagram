//
//  CameraViewController.swift
//  Instagram
//
//  Created by Andrew Bihl on 6/16/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import Photos

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    let popoverPresenter = UIPopoverPresentationController(
    @IBOutlet weak var imageView: UIImageView!
    var username : String?
    var storedImageURL : NSURL?
    
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
    
    func addImageToUserLibrary(){
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Image or Video selected")
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        var randomString = String(arc4random_uniform(110000))
        randomString = "\(randomString).jpg"
        let imageRef = FIRStorage.storage().reference().child("images").child(username!).child(randomString)
        let imageData = UIImageJPEGRepresentation(image, 0.7)
        let metaData = FIRStorageMetadata()
        metaData.contentType = "image/jpeg"
        imageRef.putData(imageData!, metadata: metaData, completion: { (metadata : FIRStorageMetadata?, error : NSError?) in
            if error != nil{
                print(error)
            }
            else{
                print("The image should have been uploaded to FIRStorage")
                self.storedImageURL = metadata!.downloadURLs![0]
            }
            self.dismissViewControllerAnimated(true, completion: nil)

        })
    }

    override func viewDidLoad() {
        let pvc = parentViewController as! TabViewController
        username = pvc.username
        
    }
    
}
    