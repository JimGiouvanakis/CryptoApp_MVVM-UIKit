//
//  NetworkCall.swift
//  NFTAPP-UIKIT
//
//  Created by Dimitris Giouvanakis on 22/10/24.
//

import UIKit
struct NetworkCall {
    
    let headers = [
        "x-rapidapi-key" : Constants.apiKey,
        "x-rapidapi-host": Constants.apiHost
    ]
    
    func fetchData() async throws  -> Data {
        
        guard let url = URL(string: Constants.apiURL) else {
            throw NetworkError.invalidUrl
        }
        
        var urlReuqest = URLRequest(url: url)
        
        urlReuqest.httpMethod = "GET"
        urlReuqest.allHTTPHeaderFields = headers
        
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: urlReuqest) { data, response, error in
                
                guard error == nil else {
                    continuation.resume(throwing: NetworkError.generalError)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                    if  let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json") {
                        do {
                            let data = try Data(contentsOf: fileLocation)
                            print("Mock Data Activated")
                            continuation.resume(returning: data)
                            return
                        } catch {
                            print("Mock Data Error")
                            continuation.resume(throwing: NetworkError.degodingError)
                            return
                        }
                    } else {
                        print("Mock Data Error")
                        continuation.resume(throwing: NetworkError.noData)
                        return
                    }
                }
                
                guard let data = data else {
                    continuation.resume(throwing: NetworkError.noData)
                    return
                }
                continuation.resume(returning: data)
            }
            task.resume()
        }
    }
}
