import SwiftUI

struct RepositoryInfoView: View {
    let name: String?
    let description: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name ?? "")
                .fontWeight(.medium)

            Text(description ?? "")
                .font(.callout)
                .fontWeight(.light)
                .lineLimit(3)
        }
    }
}

#Preview {
    RepositoryInfoView(name: "Kare", description: "aaa")
}
