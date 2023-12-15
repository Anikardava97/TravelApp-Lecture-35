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
    
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
                headerText("Destination Details")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        if let transport = destination.transport {
                            NavigationLink(destination: TransportView(transport: transport), label: {
                                SecondaryButton(icon: "bus.fill", text: "Transport")
                            })
                        }
                        
                        if let mustSee = destination.mustSee {
                            NavigationLink(destination: MustSeeView(mustSee: mustSee), label: {
                                SecondaryButton(icon: "map", text: "Must See")
                            })
                        }
                        
                        if let hotels = destination.hotels {
                            NavigationLink(destination: HotelsView(hotels: hotels), label: {
                                SecondaryButton(icon: "bed.double", text: "Hotels")
                            })
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
        }
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
