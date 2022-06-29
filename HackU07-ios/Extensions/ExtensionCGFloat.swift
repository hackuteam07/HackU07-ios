//
//  ExtensionCGFloat.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/18.
//

import UIKit

extension CGFloat {
    static var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    static var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }

    static var paddingSize: CGFloat {
        UIScreen.main.bounds.width * 0.05
    }

    static var titleTextSize: CGFloat {
        UIScreen.main.bounds.width * 0.05
    }

    static var percentageTextSize: CGFloat {
        UIScreen.main.bounds.width * 0.03
    }

    static var tableSeparatorWidth: CGFloat {
        UIScreen.main.bounds.width * 0.001
    }

    static var newsTableViewHeight: CGFloat {
        UIScreen.main.bounds.height * 0.8
    }

    // XLPagerTabのbuttonBarViewの最小コンテンツ高さが44に規定されているため、常にbuttonBarViewの高さ > コンテンツ高さになるようにする
    static var tabBarHeight: CGFloat {
        if UIScreen.main.bounds.height * 0.06 > 44 {
            return UIScreen.main.bounds.height * 0.06
        } else {
            return 44
        }
    }

    static var selectedLineHeight: CGFloat {
        UIScreen.main.bounds.height * 0.003
    }
}
