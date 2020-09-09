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
    @IBOutlet weak var cardSlot: UIImageView!
    @IBOutlet var cardSwipeRecognizer: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardSwipeRecognizer?.direction = .down
        collectionView.register(UINib(nibName: "MTACardImageCell", bundle: nil), forCellWithReuseIdentifier: "cardCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func cardSwiped(_ sender: UISwipeGestureRecognizer) {
        if cardSwipeRecognizer.state == .ended {
            UIView.animate(withDuration: 0.1, animations: {
                self.collectionView.frame.origin.y += 420
            }, completion: nil)
            UIView.animate(withDuration: 0.5, animations: {
                self.collectionView.frame.origin.y -= 420
            }, completion: nil)
        }
    }
    
    @IBAction func testButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, animations: {
            self.collectionView.frame.origin.y += 420
        }, completion: nil)
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.frame.origin.y -= 420
        }, completion: nil)
        
    }
}

extension CardViewController: UICollectionViewDataSource    {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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
        let cardCellSize = CGSize(width: 238, height: 352)
        return cardCellSize
    }
}
