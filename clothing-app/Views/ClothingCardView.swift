//
//  ClothingCardView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-20.
//

import Foundation
import SwiftUI

struct ClothingCardView : View {
    var imageName: String
    var name : String
    var price : String
    
    var body: some View{
        VStack{
            Image(systemName: imageName)
                .resizable()
                .frame(width: 150, height: 200)
                .aspectRatio(contentMode: .fit)
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
            Text(price)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
