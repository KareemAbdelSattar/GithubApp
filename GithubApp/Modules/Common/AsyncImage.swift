import SwiftUI

struct CustomAsyncImage: View {
    let image: String
    
    var body: some View {
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
        .clipShape(Circle())
        .animation(.easeIn, value: 0.5)
    }
}

#Preview {
    CustomAsyncImage(image: "")
}
