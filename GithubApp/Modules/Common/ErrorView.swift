import SwiftUI

struct ErrorView: View {
    
    // MARK: Properties
    
    let title: String
    var systemImage = "exclamationmark.warninglight"
    var action: (() -> Void)?
    
    var body: some View {
        ContentUnavailableView(label: {
            Label(title, systemImage: systemImage)
        }, actions:  {
            if let action {
                Button("Reload".localized) {
                    action()
                }
                .buttonStyle(.borderedProminent)
            }
        })
    }
}

#Preview {
    ErrorView(title: "Enter The Text To find Repositories")
}
