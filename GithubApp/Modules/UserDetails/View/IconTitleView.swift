import SwiftUI

// MARK: IconTitleView

struct IconTitleView: View {
    
    // MARK: Properties

    let image: String
    let title: String
    let color: Color
    
    init(image: String, title: String, color: Color = .secondary) {
        self.image = image
        self.title = title
        self.color = color
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: image)
                .foregroundStyle(color)
            
            Text(title)
                .foregroundStyle(.secondary)
        }
    }
}
