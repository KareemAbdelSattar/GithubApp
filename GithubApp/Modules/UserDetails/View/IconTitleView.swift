import SwiftUI

struct IconTitleView: View {
    let image: String
    let title: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: image)
                .foregroundStyle(.secondary)
            
            Text(title)
                .foregroundStyle(.secondary)
        }
    }
}
