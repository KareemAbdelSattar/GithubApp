//
//  UserRow.swift
//  HR
//
//  Created by Kareem Abd El Sattar on 09/12/2023.
//

import SwiftUI

struct UserRow: View {
    var image: String
    var name: String
    var type: String
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.7)
                    ProgressView()
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .animation(.easeIn, value: 0.5)

              
            
            VStack(alignment: .leading) {
                Text(name)
                
                Text(type)
                    .foregroundStyle(.gray)
                
            }
        }
    }
}

#Preview {
    UserRow(image: "", name: "kareem", type: "User")
}
