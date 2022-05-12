//
//  DownloadService.swift
//  CardFlip
//
//  Created by Ilya on 22.02.22.
//

import UIKit

final class DownloadService {
    // - Data
    private let urlSession: URLSession
    private var task: URLSessionDataTask?
    
    static var shared = DownloadService(.default)
    
    var cache  = NSCache<NSString, UIImage>()
    
    // - Initializer
    init(_ configuration: URLSessionConfiguration) {
        self.urlSession = URLSession(configuration: configuration)
    }
    
    // - Methods
    func download(urlString: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            completion(.success(cachedImage))
            return 
        }
        guard let url = URL(string: urlString) else {
            return completion(.failure(DownloadServiceError.invalidUrl))
        }
        task = urlSession.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(DownloadServiceError.invalidResponse))
            }
            
            guard let img = UIImage(data: data)?.resize(size: CGSize(width: 115, height: 140)) else {
                return completion(.failure(DownloadServiceError.invalidConversion))
            }
            self.cache.setObject(img, forKey: urlString as NSString)
            return completion(.success(img))
            
        })
        task?.resume()
    }
}
