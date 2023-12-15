//
//  MainScreenView.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

struct MainScreenView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = MainScreenViewModel()
    @State private var showingTipAlert = false
    @State private var selectedTip: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
               headerText("Popular Destinations")
                
                List {
                    ForEach(viewModel.destinations, id: \.id) { destination in
                        
                        NavigationLink(destination:
                                        DestinationDetailsView(destination: destination)
                                       ) {
                            
                            HStack(spacing: 16) {
                                Image(viewModel.imageName(for: destination))
                                        .resizable()
                                        .frame(width: 140, height: 80)
                                        .cornerRadius(12)
                        
                                VStack(alignment: .leading) {
                                    Text(viewModel.cityName(for: destination))
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                
                PrimaryButton(action: {
                    selectedTip = travelTips.randomElement() ?? "No travel tips available at the moment."
                    showingTipAlert.toggle()
                }, icon: "Plane", text: "Travel Tips")
                             
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Image("tripi")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {
                viewModel.fetchDestinations()
            }
            .alert(isPresented: $showingTipAlert, content: {
                Alert(title: Text("Travel Tip 🌍✈️"), message: Text(selectedTip), dismissButton: .default(Text("OK")))
            })
        }
    }
    
    // MARK: - Methods
    private func headerText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 20))
            .fontWeight(.bold)
            .padding(.top, 16)
            .padding(.horizontal, 16)
    }
}


