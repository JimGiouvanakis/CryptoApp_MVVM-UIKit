//
//  NetworkError.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import Foundation

enum NetworkError: Error {
    case generalError
    case invalidUrl
    case invalidResponse
    case noData
    case degodingError
}
