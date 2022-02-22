//
//  DownloadService.swift
//  CardFlip
//
//  Created by Ilya on 22.02.22.
//

import UIKit

final class DownloadService {
    
    let urlSession: URLSession
    var dataTask: URLSessionDataTask?
    var card: Card?
    let url = URL(string: "https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg")!
    
    init(_ configuration: URLSessionConfiguration) {
        self.urlSession = URLSession(configuration: configuration)
    }
    
    func download(completion: @escaping (Card?) -> ()) {
//        dataTask?.cancel()
        
        dataTask = self.urlSession.dataTask(with: url, completionHandler: {[weak self] (data, response, error) in
            guard error != nil else { return }

            if let data = data{
                DispatchQueue.main.async {
                    let card = Card()
                    self?.card = card
                }
            }
            
            DispatchQueue.main.async {
                completion(self?.card)
            }
            
        })
        dataTask?.resume()
        RunLoop.current.run()
    }
}
