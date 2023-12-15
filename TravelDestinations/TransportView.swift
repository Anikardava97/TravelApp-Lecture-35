//
//  TransportView.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

struct TransportView: View {
    
    let transport: [Transport]?
    
    // MARK: - Body
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                headerText("Transport")
                
                List {
                    ForEach(transport ?? [], id: \.name) { transport in
                        VStack(alignment: .leading, spacing: 0) {
                            
                            Text(transport.name)
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                                .padding(.vertical, 16)
                            
                            Image(transport.image)
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .cornerRadius(12)
                            
                            Text(transport.description)
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundStyle(.black.opacity(0.8))
                                .padding(.vertical, 16)
                            
                            Text(transport.price)
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
