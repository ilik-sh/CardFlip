//
//  ViewController.swift
//  CardFlip
//
//  Created by Ilya on 5.02.22.
//

import UIKit

class GameScreenViewController: UIViewController {
    
    // - Action
    @IBAction func buttonTouchesStarted(_ sender: UIButton) {
        sender.pressedDown()
    }
    
    @IBAction func buttonTouchesEnded(_ sender: UIButton) {
        sender.pressedUp({ [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        })
    }
    
    @IBAction func buttonTouchesEndedOutside(_ sender: UIButton) {
        sender.pressedUp({ _ in })
    }
    
    // - UI
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // - Data
    var urls = [String]()
    private var game = CardFlipGame()
    
    // - Lifecycle
    override func viewDidLoad()  {
        super.viewDidLoad()
        configure()
        setImages()
    }
    
}

    //  MARK: -CollectionViewDataSource
extension GameScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: "reuseCell", for: indexPath) as! CollectionViewCell
        cell.card = game.cardAtIndex(indexPath.item)
        return cell
    }
}

    //  MARK: -CollectionViewDelegate
extension GameScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
    
        guard let card = cell.card else { return }
        game.didSelectCard(card)
    }
}

    // MARK: -CardFlipGameDelegate
extension GameScreenViewController: CardFlipGameDelegate {
    func setImages() {
        let urls = Theme.current.imgUrlArray
        for url in urls {
            DownloadService.shared.download(urlString: url, completion: { [weak self] result in
                switch result {
                case .success(let img):
                    let card = Card(img)
                    self?.game.cards.append(card)
                    self?.game.cards.append(card.copy())
                    DispatchQueue.main.async {
                        self?.collectionView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    func flipCards(_ cards: [Card]) {
        for card in cards {
            guard let index = game.indexForCard(card) else { return }
            let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! CollectionViewCell
            cell.flip()
        }
    }
    
    func updateScore(_ score: Int) {
        scoreLabel.text = "Score: \(score)"
    }
    
    func resetData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

    // MARK: -Configure
fileprivate extension GameScreenViewController {
    private func configure() {
        configureCollectionView()
        configureDelegates()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configureDelegates() {
        game.delegate = self
    }
    
}

