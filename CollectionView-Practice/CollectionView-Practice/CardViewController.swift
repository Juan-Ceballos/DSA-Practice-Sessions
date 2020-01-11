//
//  CardViewController.swift
//  CollectionView-Practice
//
//  Created by Juan Ceballos on 1/11/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "MTACardImageCell", bundle: nil), forCellWithReuseIdentifier: "cardCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CardViewController: UICollectionViewDataSource    {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? MTACardImageCell
            else    {
                fatalError()
        }
        
        cell.configureCell()
        
        return cell
    }
    
    
}

extension CardViewController: UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cardCellSize = CGSize(width: 400, height: 400)
        return cardCellSize
    }
}
