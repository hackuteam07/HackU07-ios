//
//  ExtensionUIColor.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/13.
//

import UIKit

extension UIColor {
    class var baseBlack: UIColor {
        UIColor(named: "baseBlack") ?? .black
    }

    class var borderGray: UIColor {
        UIColor(named: "borderColor") ?? .gray
    }

    class var highlightWhite: UIColor {
        UIColor(named: "highlightWhite") ?? .white
    }

    class var progressBackColor: UIColor {
        UIColor(named: "progressBackColor") ?? .clear
    }

    class var progressGreen: UIColor {
        UIColor(named: "progressGreen") ?? .systemGreen
    }
}
