//
//  ExtensionDouble.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/24.
//

import Foundation

extension Float {
    var rounded4: Float {
        let value = (self * 1000).rounded()
        return value / 1000
    }
}
