//
//  ViewController.swift
//  CollectionView-Practice
//
//  Created by Juan Ceballos on 1/10/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mtaCardCollectionView: UICollectionView!
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "CardCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mtaCardCollectionView.delegate = self
        mtaCardCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let flowLayout = self.mtaCardCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: self.mtaCardCollectionView.bounds.width, height: 120)
        }
    }

    func setupCollectionView()  {
        
    }

}

extension ViewController: UICollectionViewDataSource    {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CardImageCell
        
        cell.cardImageView.image = #imageLiteral(resourceName: "metrocard")
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate  {
    
}
