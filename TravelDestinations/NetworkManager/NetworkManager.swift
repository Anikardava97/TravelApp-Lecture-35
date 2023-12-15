//
//  NetworkManager.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://mocki.io/v1/b35bdf06-c481-439b-a33f-df51ab4c3e6a"
    
    private init() {}
    
    // MARK: - Fetch Destinations
    func fetchDestinations(completion: @escaping (Result<[Destination], Error>) -> Void) {
        let urlStr = baseURL
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let destinationsResponse = try JSONDecoder().decode(DestinationsResponse.self, from: data)
                completion(.success(destinationsResponse.destinations))
            } catch {
                print("JSON Decoding Error: \(error)")
                    completion(.failure(error))
                    return
                }
        }.resume()
    }
}
 
