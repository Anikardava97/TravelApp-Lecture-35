//
//  SecondaryButton.swift
//  TravelDestinations
//
//  Created by Ani's Mac on 14.12.23.
//

import SwiftUI

struct SecondaryButton: View {
    var icon: String
    var text: String

        var body: some View {
                HStack(spacing: 10) {
                    Image(systemName: icon)
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 16, height: 16)
                    
                    Text(text)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                }
                .frame(height: 54)
                .padding(.horizontal, 16)
                .background(.black)
                .cornerRadius(8)
        }
    }
