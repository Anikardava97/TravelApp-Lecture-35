//
//  HotelsView.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

struct HotelsView: View {
    
    let hotels: [Hotel]?
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                headerText("Hotels")
                
                List {
                    
                    ForEach(hotels ?? [], id: \.name) { hotel in
                        
                        VStack(alignment: .leading, spacing: 0) {
                            
                            Text(hotel.name)
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                                .padding(.vertical, 16)
                            
                            Image(hotel.image)
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .cornerRadius(12)
                            
                            Text(hotel.description)
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundStyle(.black.opacity(0.8))
                                .padding(.vertical, 16)
                            
                            Text(hotel.price)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                        }
                    }
                }
                .listStyle(.plain)
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
