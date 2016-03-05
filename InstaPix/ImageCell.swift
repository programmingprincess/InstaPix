//
//  ImageCell.swift
//  InstaPix
//
//  Created by Jiaqi Wu on 3/4/16.
//  Copyright © 2016 Jiaqi Wu. All rights reserved.
//

import UIKit
import Parse

class ImageCell: UITableViewCell {

    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    var img: PFObject! {
        didSet {
            captionLabel.text = img.objectForKey("caption") as? String
        
            let imageData = img.objectForKey("media") as? PFFile
            imageData!.getDataInBackgroundWithBlock { (imageInfo: NSData?, error: NSError?) -> Void in
                if(error == nil) {
                    let picture = UIImage(data: imageInfo!)
                    self.displayImageView.image = picture
                }
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
