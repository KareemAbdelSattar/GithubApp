//
//  UserRow.swift
//  HR
//
//  Created by Kareem Abd El Sattar on 09/12/2023.
//

import SwiftUI

struct UserRow: View {
    var user: User
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: user.avatarURL)) { image in
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
                Text(user.login)
                
                Text(user.type.rawValue)
                    .foregroundStyle(.gray)
                
            }
        }
    }
}

#Preview {
    UserRow(user: User(login: "Kareem", id: 1, avatarURL: "", type: .user))
}
