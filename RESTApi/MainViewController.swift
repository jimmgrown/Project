//
//  MainViewController.swift
//  RESTApi
//
//  Created by user152741 on 21/05/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

import UIKit
import SwiftyVK
import Alamofire
import AlamofireImage
import SwiftyJSON

class MainViewController: UIViewController {
    @IBOutlet weak var imageViewMain: UIImageView!
    
    @IBOutlet weak var labelViewMain: UILabel!
    @IBOutlet weak var textViewMain: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageStringUrl = "https://vk.com/stairpanity?z=photo-63458533_317851565%2Falbum-63458533_0%2Frev"
        if let imageUrl = URL(string: imageStringUrl){
        imageViewMain.af_setImage(withURL: imageUrl)
        }
        let url = "https://jsonplaceholder.typicode.com/todos"
        let request = Alamofire.request(url, method: .get, parameters: nil, headers: nil)
        request.responseJSON { (response) -> Void in
            if let json = response.result.value as? [[String:Any?]] {
                var text = ""
                for model in json {
                    text += model["title"] as! String
                    text += "\n"
                }
                self.textViewMain.text = text
        // Do any additional setup after loading the view.
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
