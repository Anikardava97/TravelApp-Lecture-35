//
//  DestinationDetailsView.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

struct DestinationDetailsView: View {
    @EnvironmentObject var viewModel: MainScreenViewModel
    var destination: Destination
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            
            headerText("Destination Details")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    NavigationLink(value: destination.hotels) {
                        SecondaryButton(icon: "bed.double", text: "Hotels")
                    }
                    .navigationDestination(for: [Hotel].self) { hotel in
                        HotelsView(hotels: hotel, path: $path)
                    }
                    
                    NavigationLink(value: destination.mustSee) {
                        SecondaryButton(icon: "map", text: "Must See")
                    }
                    .navigationDestination(for: [MustSee].self) { mustSee in
                        MustSeeView(mustSee: mustSee, path: $path)
                    }
                    
                    NavigationLink(value: destination.transport) {
                        SecondaryButton(icon: "bus.fill", text: "Transport")
                    }
                    .navigationDestination(for: [Transport].self) { transport in
                        TransportView(transport: transport, path: $path)
                    }
                }
                
            }
            .padding(.leading, 16)
            .padding(.vertical, 6)
        }
        
        Image(destination.cityName ?? "")
            .resizable()
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .cornerRadius(12)
            .padding(.horizontal, 16)
        
        Text(destination.description ?? "")
            .font(.system(size: 16))
            .fontWeight(.regular)
            .foregroundStyle(.black.opacity(0.5))
            .padding(.vertical, 16)
            .padding(.horizontal, 16)
        
        Spacer()
    }
    
    
    // MARK: - Methods
    func headerText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .padding(.top, 16)
            .padding(.horizontal, 16)
    }
}
