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
//      dataTask?.cancel()
        dataTask = urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let data = data{
                guard let img = UIImage(data: data) else { return }
                let card = Card(with: img)
                completion(card)
            }
        })
        dataTask?.resume()
        sleep(1)
    }
}
