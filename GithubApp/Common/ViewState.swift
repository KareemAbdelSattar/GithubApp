import Foundation

enum ViewState<T: Decodable> {
    case loading
    case empty
    case loaded(T)
    case error(String)
}
