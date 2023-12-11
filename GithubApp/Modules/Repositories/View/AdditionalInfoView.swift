//
//  AdditionalInfoView.swift
//  GithubApp
//
//  Created by Kareem Abd El Sattar on 11/12/2023.
//

import SwiftUI

struct AdditionalInfoView: View {
    let starCount: Int
    let language: String?

    var body: some View {
        HStack {
            IconTitleView(image: "star", title: "\(starCount)")

            if let language = language {
                IconTitleView(image: "circle.fill", title: language, color: .orange)
            }
        }
    }
}

#Preview {
    AdditionalInfoView(starCount: 12, language: "Java")
}
