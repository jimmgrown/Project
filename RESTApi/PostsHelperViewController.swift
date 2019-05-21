//
//  ImageCollectionViewCell.swift
//  RESTApi
//
//  Created by user152741 on 26/04/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

import UIKit
import SwiftyVK
import SwiftyJSON

class PostsHelperViewController: UITableViewCell {
    
    @IBOutlet weak var imageViewRow: UIImageView!
    
    @IBOutlet weak var textViewRow: UITextView!
    func setupRow(stringURL: String, stringText: String){
        if let url = URL(string: stringURL){
            imageViewRow.af_setImage(withURL: url)
            
        }
        textViewRow.text = stringText
        
    }
    
}
