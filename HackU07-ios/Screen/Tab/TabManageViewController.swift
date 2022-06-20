//
//  TabManageViewController.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/18.
//

import UIKit
import XLPagerTabStrip

class TabManageViewController: ButtonBarPagerTabStripViewController {
    lazy var yahooVC = NewsViewController()

    lazy var buttonBar: ButtonBarView = {
        let view = buttonBarView
        return view!
    }()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let y = .deviceHeight - .newsTableViewHeight - yahooVC.sortIcon.frame.height - .paddingSize * 0.5 - .tabBarHeight

        buttonBar.frame = CGRect(x: 0, y: y, width: .deviceWidth, height: .tabBarHeight)
    }

    override func viewDidLoad() {
        settings.style.buttonBarBackgroundColor = .baseBlack
        settings.style.buttonBarItemBackgroundColor = .baseBlack
        settings.style.selectedBarBackgroundColor = .highlightWhite
        settings.style.selectedBarHeight = .selectedLineHeight
        settings.style.buttonBarItemTitleColor = .white

        super.viewDidLoad()
        view.addSubview(buttonBar)
        view.backgroundColor = .baseBlack
    }

    override func viewControllers(for _: PagerTabStripViewController) -> [UIViewController] {
//        Future work: スクレイピング先のサイトを増やしたときVCを新規作成、追加する

        let childViewControllers: [UIViewController] = [yahooVC]
        return childViewControllers
    }

    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidDisappear(_: Bool) {
        super.viewDidDisappear(true)
        navigationController?.isNavigationBarHidden = false
    }
}
