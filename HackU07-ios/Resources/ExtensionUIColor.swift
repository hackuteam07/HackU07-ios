//
//  ExtensionUIColor.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/13.
//

import UIKit

extension UIColor {
    
    class var baseBlack: UIColor {
        return UIColor(named: "baseBlack") ?? .black
    }
    
    class var borderGray: UIColor {
        return UIColor(named: "borderColor") ?? .gray
    }
    
    class var highlightWhite: UIColor {
        return UIColor(named: "highlightWhite") ?? .white
    }
    
    class var progressBackColor: UIColor {
        return UIColor(named: "progressBackColor") ?? .clear
    }
    
    class var progressGreen: UIColor {
        return UIColor(named: "progressGreen") ?? .systemGreen
    }
}
