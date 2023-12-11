import SwiftUI

struct IconLinkView: View {
    let image: String
    let title: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: image)
                .foregroundStyle(.secondary)
            
            Link(title, destination: URL(string: title)!)
                .foregroundColor(.primary)
            
        }
    }
}
