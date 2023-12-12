//
//  ErrorView.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import SwiftUI

struct ErrorView: View {
    let title: String
    let image: String
    
    var body: some View {
        VStack(spacing: 40) {
            Image(systemName: image)
              .resizable()
              .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.primary)
            
            Text(title)
                .font(.subheadline)
                .lineLimit(2)

        }
    }
}

#Preview {
    ErrorView(title: "Enter The Text To find Repositories", image: "magnifyingglass")
}
