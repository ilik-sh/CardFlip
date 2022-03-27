//
//  ViewController.swift
//  CardFlip
//
//  Created by Ilya on 5.02.22.
//

import UIKit

class ViewController: UIViewController {
    // - UI
    @IBAction func pressedPlayButton(_ sender: UIButton) {
        game.startGame()
        collectionView.reloadData()
        collectionView.isHidden = false
        sender.isHidden = true
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // - Data
    var score = 0
    let game = CardFlipGame()
    let service = DownloadService(.default)
    let urls = ["https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg",
                "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZG9tZXN0aWMlMjBjYXR8ZW58MHx8MHx8&w=1000&q=80",
                "https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg?q=60"
               ]
    
    // - Lifecycle
    override func viewDidLoad()  {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        game.delegate = self
        setImages()
    }
}

    // - CollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: "reuseCell", for: indexPath) as! CollectionViewCell
        cell.card = game.cardAtIndex(indexPath.item)
        cell.frontView.layer.cornerRadius = 7
        cell.backView.layer.cornerRadius = 7
        return cell
    }
}

// -func  Col;lectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        if cell.isFlipped { return }
        
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
    
    func setImages() {
        for url in urls {
            service.download(urlString: url, completion: { [weak self] result in
                switch result {
                case .success(let img):
                    let card = Card(with: img)
                    self?.game.cards.append(card)
                    self?.game.cards.append(card.copy())
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    func setupGame() {
        collectionView.reloadData()
    }
        
}

