//
//  Post.swift
//  InstaPix
//
//  Created by Jiaqi Wu on 3/4/16.
//  Copyright © 2016 Jiaqi Wu. All rights reserved.
//

import UIKit
import Parse

class Post: NSObject {
    /***
     * Other methods
     */
    
    /*
    Method to add a user post to Parse (uploading image file)
    
    - parameter image: Image that user wants to upload to parse
    - parameter caption: Caption text inputted by user
    - parameter completion: Block to be executed after save operation is complete
    */
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        
        let post = PFObject(className: "Post")
        
        post["media"] = getPFFileFromImage(image)   //PFFile column type
        post["author"] = PFUser.currentUser()       //pointer to PFUser
        post["caption"] = caption
        post["likesCount"] = 0
        post["commentsCount"] = 0

        //save object
        post.saveInBackgroundWithBlock(completion)
        
    }
    
    /**
    Method to convert UIImage to PFFile
    
    - parameter image: Image that user wants to upload 
    - returns: PFFile for the data in the image
    */
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        //check to make sure image is not nil 
        if let image = image {
            //get image data and check if that's not nil
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}
