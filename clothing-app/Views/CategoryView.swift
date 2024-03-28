//
//  CategoryView.swift
//  clothing-app
//
//  Created by Sajana Rupasinghe on 2024-03-29.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var viewModel = CategoryViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.categories, id: \.self) { category in
                Text(category)
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
