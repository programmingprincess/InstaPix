//
//  UploadViewController.swift
//  InstaPix
//
//  Created by Jiaqi Wu on 3/4/16.
//  Copyright © 2016 Jiaqi Wu. All rights reserved.
//

import UIKit
import Parse

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageToUpload: UIImageView!

    @IBOutlet weak var captionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onCancel(sender: AnyObject) {
        
        //dismiss modal view
        dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func onUpload(sender: AnyObject) {

        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
        //getObjectInBackgroundWithId methods are asynchronous; code after this will run immediately.
        //code that is dependent on query result should be moved inside the completion block
    }
    
    
    //take a picture and post!
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        //get image captured by the UIImagePickerController
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        imageToUpload.image = originalImage
        
        print(originalImage)
        print("You chose a picture!")
        
        //Do something with the iamges here (based on your use case!!!)
        
        //Dismiss UIImagePickerController when finished; go back to original view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onTakePic(sender: AnyObject) {
        
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func onSubmit(sender: AnyObject) {
        Post.postUserImage(imageToUpload.image, withCaption: captionField.text, withCompletion: nil)
        
        dismissViewControllerAnimated(true, completion: nil)
        
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
