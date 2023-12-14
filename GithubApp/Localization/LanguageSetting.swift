import SwiftUI

@Observable
class LanguageSetting {

    var locale = Locale.current
    
    var layout: LayoutDirection {
      isRightToLeft ? .rightToLeft : .leftToRight
    }
    
    var isRightToLeft: Bool {
      get {
          return isLanguageRightToLeft(language: locale.identifier)
      }
    }
    
    private func isLanguageRightToLeft(language: String) -> Bool {
        return Locale.Language(identifier: language).characterDirection == .rightToLeft
    }

    var uuid: String {
      get {
        return UUID().uuidString
      }
    }
}
