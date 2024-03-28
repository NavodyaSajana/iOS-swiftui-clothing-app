//
//  DashboardView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack{
            TabView{
                HomeView()
                    .tabItem {
                        Label("Home",systemImage: "house")
                    }
                FavouriteView()
                    .tabItem {
                        Label("Favourites",systemImage: "heart")
                    }
                NotificationView()
                    .tabItem {
                        Label("Notifications",systemImage: "bell")
                    }
                UserView()
                    .tabItem {
                        Label("Me",systemImage: "person")
                    }                
            }
        }
        //.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DashboardView()
}
