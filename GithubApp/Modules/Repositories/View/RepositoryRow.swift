//
//  RepositoryRow.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import SwiftUI

struct RepositoryRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(.github)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                
                Text("Kareem")
                    .font(.caption)
                    .fontWeight(.light)
            }
            
            Text("Alamofire")
                .fontWeight(.medium)
            
            
            Text("Next-generation take on pre/post function hooks")
                .font(.callout)
                .fontWeight(.light)
                .lineLimit(3)
            
            IconTitleView(image: "star", title: "5")
        }
    }
}

#Preview {
    RepositoryRow()
}
