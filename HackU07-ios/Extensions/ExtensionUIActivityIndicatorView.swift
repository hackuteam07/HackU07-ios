//
//  ExtensionUIActivityIndicatorView.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/24.
//

import Foundation
import UIKit

extension UIActivityIndicatorView {
    func updateStatus(_ isLoading: Bool) {
        isLoading ? startAnimating() : stopAnimating()
    }
}
