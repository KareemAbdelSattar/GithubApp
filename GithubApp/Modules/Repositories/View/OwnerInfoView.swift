//
//  OwnerInfoView.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import SwiftUI

struct OwnerInfoView: View {
    let avatarURL: String
    let fullName: String?

    var body: some View {
        HStack {
            CustomAsyncImage(image: avatarURL)
                .frame(width: 20, height: 20)

            Text(fullName ?? "")
                .font(.caption)
                .fontWeight(.light)
        }
    }
}

#Preview {
    OwnerInfoView(avatarURL: "", fullName: "ss")
}
