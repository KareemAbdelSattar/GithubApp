import SwiftUI

struct CustomAsyncImage: View {
    
    // MARK: Properties
    
    let image: String
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.2)
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
