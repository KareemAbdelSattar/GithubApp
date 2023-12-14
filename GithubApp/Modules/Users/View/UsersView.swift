import SwiftUI


// MARK: - UsersView

struct UsersView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: UsersListViewModel
    @Environment(LanguageSetting.self) var language
    
    
    var body: some View {
        VStack {
            Button("Change Langue") {
                let newLang = language.locale.identifier == "en" ? "ar" : "en"
                language.locale = Locale(identifier: newLang)
            }
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .empty:
                EmptyView()
            case .loaded(let users):
                UsersListView(users: users)
            case .error(let error):
                Text(error)
            }
        }   
        .onAppear(perform: {
            viewModel.onAppear.send()
        })
    }
}

#Preview {
    UsersView(viewModel: UsersListViewModel())
}
