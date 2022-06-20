//
//  LanguageManager.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

enum Language: String {
    case arabic = "ar"
    case english = "en_US"
}

struct LanguageManager {
    private let appleLanguagesKey = "AppleLanguages"
    
    func getCurrentAppLanguage() -> Language {
        guard let language = UserDefaults.standard.array(forKey: appleLanguagesKey)?.first as? String else {
            return .english
        }
        return Language(rawValue: language) ?? .arabic
    }
}
