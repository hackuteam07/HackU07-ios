//
//  ExtensionUIAlertController.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/24.
//

import Foundation
import UIKit

extension UIAlertController {
    static func errorAlert(message: String?, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: "エラーが発生しました", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(action)
        return alert
    }
}
