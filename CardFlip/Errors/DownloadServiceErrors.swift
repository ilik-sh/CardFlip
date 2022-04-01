//
//  DownloadServiceErrors.swift
//  CardFlip
//
//  Created by Ilya on 31.03.22.
//

import Foundation

enum DownloadServiceError: Error {
    case invalidUrl
    case invalidResponse
    case invalidConversion
}
