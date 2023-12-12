import SwiftUI

struct AdditionalInfoView: View {
    
    // MARK: Properties

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
