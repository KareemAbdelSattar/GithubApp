import SwiftUI

@Observable
class LanguageSetting {

    var locale = Locale(identifier: "ar")
    
    var layout: LayoutDirection {
      isRightToLeft ? .rightToLeft : .leftToRight
    }
    
    var isRightToLeft: Bool {
      get {
          return isLanguageRightToLeft(language: locale.identifier)
      }
    }
    
    var currentLang: String {
        locale.identifier == "ar" ? "English" : "العربية"
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
