import SwiftUI

struct IconTitleView: View {
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
