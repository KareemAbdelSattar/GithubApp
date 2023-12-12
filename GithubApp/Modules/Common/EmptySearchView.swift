import SwiftUI

struct EmptySearchView: View {
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
    EmptySearchView(title: "Enter The Text To find Repositories", image: "magnifyingglass")
}
