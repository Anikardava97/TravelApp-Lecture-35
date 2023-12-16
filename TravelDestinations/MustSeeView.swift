//
//  MustSeeView.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

struct MustSeeView: View {
    
    let mustSee: [MustSee]?
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            headerText("Must See Destinations")
            
            List {
                
                ForEach(mustSee ?? [], id: \.name) { mustSee in
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        Text(mustSee.name)
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .foregroundStyle(.black)
                            .padding(.vertical, 16)
                        
                        Image(mustSee.image)
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(12)
                        
                        Text(mustSee.description)
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundStyle(.black.opacity(0.8))
                            .padding(.vertical, 16)
                    }
                }
            }
            .listStyle(.plain)
            
            PrimaryButton(action: {
                while !path.isEmpty {
                    path.removeLast()
                }
            }, icon: "home", text: "Go to Homepage")
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

