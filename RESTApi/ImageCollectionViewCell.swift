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

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    func setup(stringURL: String){
        if let url = URL(string: stringURL){
    imageView.af_setImage(withURL: url)
            
        }
    }
    
}
