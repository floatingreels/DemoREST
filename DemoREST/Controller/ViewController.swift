//
//  ViewController.swift
//  DemoREST
//
//  Created by mobapp02 on 22/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = DAO.sharedInstance.getAllPosts()
    }
}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostCollectionViewCell
        
        let post = items[indexPath.item]
        
        cell.postLabel.text = post.title
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //nakijken of de segue de juiste is
        if segue.identifier == "showDetailSegue" {
            //welke cel is de sender
            let cellToDetail = sender as! UICollectionViewCell
            //op welke rij in de tabel staat cel
            let indexPath = collectionView.indexPath(for: cellToDetail)!
            //welk object zat in de cel
            let post = items[indexPath.item]
            //wat is de bestemming van de segue
            let detailVC = segue.destination as! PostDetailViewController
            //de gegevens doorsturen
            detailVC.postToDetail = post
        }
    }
}
