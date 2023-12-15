//
//  TravelDestinationsApp.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

@main
struct TravelDestinationsApp: App {
    var body: some Scene {
        WindowGroup {
            MainScreenView()
                            .environmentObject(MainScreenViewModel())
        }
    }
}
