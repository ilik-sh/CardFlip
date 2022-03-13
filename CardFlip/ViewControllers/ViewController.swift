//
//  ViewController.swift
//  CardFlip
//
//  Created by Ilya on 5.02.22.
//

import UIKit

class ViewController: UIViewController {
    // - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // - Data
    var score = 0
    let game = CardFlipGame()
    var cards = [Card]()
    let service = DownloadService(.default)
    
    // - Lifecycle
    override func viewDidLoad()  {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        game.delegate = self
        self.setupGame()
    }
}

    // - CollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath) as! CollectionViewCell
        cell.card = game.cardAtIndex(indexPath.item)
        cell.frontView.layer.cornerRadius = 7
        cell.backView.layer.cornerRadius = 7
        return cell
    }
}

    // - CollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        if cell.isFlipped { return }
//        cell.flip()
        
        game.didSelectCard(cell.card!)
    }
}

extension ViewController: CardFlipGameDelegate {
    func flipCards(_ cards: [Card]) {
        for card in cards {
            guard let index = game.indexForCard(card) else { return }
            let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! CollectionViewCell
            cell.flip()
        }
    }
    
    func updateScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    func setupGame() {
        service.createCardArray(completion: { (cards) in
            self.cards = cards!
        })
        game.cards = cards
        game.startGame()
        collectionView.reloadData()
    }
}

