//
//  UIView+InitFromNib.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit

extension UIView {

    func initFromNib() {
        let bundle = Bundle(for: Swift.type(of: self))
        let nib = UINib(nibName: String(describing: Swift.type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Can not Load nib")
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
}
