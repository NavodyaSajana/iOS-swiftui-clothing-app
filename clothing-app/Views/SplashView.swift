//
//  SplashView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-13.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationStack
        {
            VStack{
                Text("Hello Clothing App")
                NavigationLink("Click Here", destination: HomeView())
            }
            .padding()
        }
    }
}

#Preview {
    SplashView()
}
