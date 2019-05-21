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

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imagesID = [Int]()
    var indexDidSelected: Int = 0
    var imagesArray = [String](){
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openArticle" {
            if let destinationVC = segue.destination as? ArticleViewController {
                destinationVC.imagesArray = imagesArray
                destinationVC.indexArticle = indexDidSelected
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        VK.API.Photos.get([Parameter.ownerId : "-63458533",Parameter.albumId: "184642636",Parameter.count: "20"])
            .onSuccess { (result) in
                let json = JSON(result)
                for indexjson in 0...19{
                let url = json["items"][indexjson]["sizes"][0]["url"].stringValue
                self.imagesArray.append(url)
                }
                
                            }
            .onError { (error) in
                print(error)
            }.send()
        
    }


}
extension ViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexDidSelected = indexPath.item
        performSegue(withIdentifier: "openArticle", sender: nil)
        
    }
}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.setup(stringURL: imagesArray[indexPath.item])
     
        return cell
    }
}



extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width - 30
        let cellSize = size / 2
        
        return CGSize(width: cellSize, height: cellSize)
    }
}
