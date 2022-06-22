//
//  PresenterToViewProtocol.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

protocol PresenterToViewProtocol: AnyObject {
    func showLoadingView()
    func hideLoadingView(completion: (() -> Void)?)
    func showErrorMessage(title: String?, error: String)
}
