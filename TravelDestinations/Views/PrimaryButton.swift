//
//  PrimaryButton.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

    struct PrimaryButton: View {
        
        var action: () -> Void
        var icon: String
        var text: String

        var body: some View {
            Button(action: action) {
                HStack(spacing: 8) {
                    Image(icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(text.capitalized)
                        .foregroundColor(.black)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color(red: 55/255, green: 255/255, blue: 207/255))
                .cornerRadius(8)
                .padding(.horizontal, 16)
            }
        }
    }
