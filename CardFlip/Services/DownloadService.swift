//
//  DownloadService.swift
//  CardFlip
//
//  Created by Ilya on 22.02.22.
//

import UIKit

enum DownloadServiceError: Error {
    case invalidUrl
    case invalidResponse
    case invalidConversion
}

final class DownloadService {
    // - Data
    let urlSession: URLSession
    var task: URLSessionDataTask?
    let urls = ["https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554_1280.jpg",
                "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZG9tZXN0aWMlMjBjYXR8ZW58MHx8MHx8&w=1000&q=80",
                "https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg?q=60"
               ]
    
    // - Initializer
    init(_ configuration: URLSessionConfiguration) {
        self.urlSession = URLSession(configuration: configuration)
    }
    
    // - Methods
    func download(urlString: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            return completion(.failure(DownloadServiceError.invalidUrl))
        }
        task = urlSession.dataTask(with: url, completionHandler: { data, response, error in
            print("Task started")
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(DownloadServiceError.invalidResponse))
            }
            
            guard let img = UIImage(data: data)?.resize(size: CGSize(width: 115, height: 140)) else {
                return completion(.failure(DownloadServiceError.invalidConversion))
            }
                print(img)
                return completion(.success(img))
        })
        task?.resume()
    }
}
