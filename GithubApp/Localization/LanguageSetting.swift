import SwiftUI


class LanguageSetting: ObservableObject {
    @AppStorage("preferredLocale") private var selectedLanguage: AppLanguage = .arabic

    var localeIdentifier: String {
        selectedLanguage.rawValue
    }

    var layoutDirection: LayoutDirection {
        selectedLanguage == .arabic ? .rightToLeft : .leftToRight
    }

    var locale: Locale {
        Locale(identifier: localeIdentifier)
    }

    var currentLanguage: AppLanguage {
        selectedLanguage
    }
    
    var uuid: String {
        get {
            return UUID().uuidString
        }
    }

    func changeLanguage(_ language: AppLanguage) {
        selectedLanguage = language
    }
}

enum AppLanguage: String, CustomStringConvertible {
    case english = "en"
    case arabic = "ar"
    
    var description: String {
        switch self {
        case .arabic:
            "العربية"
        case .english:
            "English"
        }
    }
}

