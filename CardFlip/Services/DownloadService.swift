//
//  DownloadService.swift
//  CardFlip
//
//  Created by Ilya on 22.02.22.
//

import UIKit

final class DownloadService {
    // - Data
    let urlSession: URLSession
    var task: URLSessionDataTask?
    var card: Card?
    let urls = [URL(string: "https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg")!,
               URL(string: "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZG9tZXN0aWMlMjBjYXR8ZW58MHx8MHx8&w=1000&q=80")!,
               URL(string: "https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg?q=60")!
               ]
    
    // - Initializer
    init(_ configuration: URLSessionConfiguration) {
        self.urlSession = URLSession(configuration: configuration)
    }
    
    // - Methods
    func download(url: URL, completion: @escaping (Card?) -> ()) {
        task?.cancel()
            task = urlSession.dataTask(with: url, completionHandler: {(data, response, error) in
                if let data = data{
                    guard let img = UIImage(data: data)?.resize(size: CGSize(width: 230, height: 280)) else { return }
                    let card = Card(with: img)
                    completion(card)
                }
            })
            task?.resume()
            sleep(1)
    }
    
    func createCardArray (completion: @escaping ([Card]?) -> ()) {
        var cards = [Card]()
        for url in urls {
            download(url: url) { (card) in
                cards.append(card!)
                cards.append(card!.copy())
            }
        }
        completion(cards)
    }
}
