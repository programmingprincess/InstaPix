//
//  ProfileViewController.swift
//  InstaPix
//
//  Created by Jiaqi Wu on 3/4/16.
//  Copyright © 2016 Jiaqi Wu. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onChoosePic(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
        
        
        //Fetching data from Parse via PFQuery 
        var query = PFQuery(className: "Post")
        query.getObjectInBackgroundWithId("imkmJsHVIH") {
            (post: PFObject?, error:NSError?) -> Void in
            
            if error == nil
                //&& gameScore != nil 
            {
                print(post)
            } else {
                print(error)
            }
        }
        
        //getObjectInBackgroundWithId methods are asynchronous; code after this will run immediately. 
        //code that is dependent on query result should be moved inside the completion block
    }//end of onChoosePic
    
    @IBAction func onTakePic(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
    
    }
    
    
    @IBAction func onLogout(sender: AnyObject) {
        
        PFUser.logOut()
        //self.performSegueWithIdentifier("logoutSegue", sender: nil)
        
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
