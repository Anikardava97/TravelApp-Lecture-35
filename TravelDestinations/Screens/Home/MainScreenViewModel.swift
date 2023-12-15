//
//  MainScreenViewModel.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

class MainScreenViewModel: ObservableObject {
    // MARK: - Properties
    @Published var destinations: [Destination] = []
    @Published var error: Error?
    
    // MARK: - Methods
    func fetchDestinations() {
        NetworkManager.shared.fetchDestinations { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let destinations):
                    self.destinations = destinations
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    func imageName(for destination: Destination) -> String {
        if let imageName = destination.mainImage, !imageName.isEmpty {
            return imageName
        } else {
            return "placeholder"
        }
    }
    
    func cityName(for destination: Destination) -> String {
        return destination.cityName?.capitalized ?? "Unknown City"
    }
}

