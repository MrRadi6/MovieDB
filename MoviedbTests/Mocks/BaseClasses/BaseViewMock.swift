//
//  BaseViewMock.swift
//  MoviedbTests
//
//  Created by Samir on 6/23/22.
//

import Foundation
@testable import Moviedb

class BaseViewMock: PresenterToViewProtocol {
    var isLoaderPresented = false
    var isLoaderDismissed = false
    var error: BaseErrorMock?

    func showLoadingView() {
        isLoaderPresented = true
    }

    func hideLoadingView(completion: (() -> Void)?) {
        isLoaderDismissed = true
    }

    func showErrorMessage(title: String?, error: String) {
        self.error = BaseErrorMock(title: title, message: error)
    }
}
