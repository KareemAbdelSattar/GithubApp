import SwiftUI

struct UserRow: View {
    
    // MARK: - Properties
    
    let user: User
    
    var body: some View {
        HStack(alignment: .top) {
            CustomAsyncImage(image: user.avatarURL)
                .frame(width: 50, height: 50)
            
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
