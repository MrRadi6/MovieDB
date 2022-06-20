//
//  String+Localizable.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
