//
//  HomeView.swift
//  HR
//
//  Created by Kareem Abd El Sattar on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
          UsersListView(viewModel: UsersListViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Users")
                    }
                }
            
            Text("Repo")
                .tabItem {
                      VStack {
                          Image(systemName: "book.pages.fill")
                          Text("Repo")
                      }
                  }
            
            Text("Favorite")
                  .tabItem {
                      VStack {
                          Image(systemName: "star")
                          Text("Favorite")
                      }
                  }
        }
    }
}

#Preview {
    HomeView()
}
