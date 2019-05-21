//
//  ViewController.swift
//  RESTApi
//
//  Created by user152741 on 26/04/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

import UIKit
import AlamofireImage
import SwiftyVK

class PostsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var imagesID = [Int]()
    var indexDidSelected: Int = 0
    var imagesArray = [String](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        VK.API.Wall.get([Parameter.ownerId: "-63458533",Parameter.count: "20",Parameter.offset: "1"] )
            .onSuccess { (result) in
                let json = JSON(result)
                for indexjson in 0...19{
                    let url = json["items"][indexjson]["attachments"][0]["photo"]["sizes"][3]["url"].stringValue
                    self.imagesArray.append(url)
                    let test = json["items"][indexjson]["text"]
                    print(test)
                    let text = json["items"][indexjson]["text"].stringValue

                    self.textArray.append(text)
                }
                
            }
            .onError { (error) in
                print(error)
            }.send()
        
    }
    
    
}
extension PostsViewController:UITableViewDelegate{

}

extension PostsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsHelperViewController", for: indexPath) as! PostsHelperViewController
        
        cell.setupRow(stringURL: imagesArray[indexPath.row], stringText: textArray[indexPath.row])
        
        return cell
    }

}




