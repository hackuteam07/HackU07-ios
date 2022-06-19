//
//  ViewController.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/13.
//

import UIKit
import XLPagerTabStrip

class ViewController: UIViewController, IndicatorInfoProvider {
    var tabInfo: IndicatorInfo = "Yahoo!ニュース"
    lazy var newsTableView = NewsTableView()
    lazy var sortIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "SortIcon"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(sortIcon)
        view.backgroundColor = .baseBlack
        view.addSubview(newsTableView)
        newsTableView.register(NewsCellView.self, forCellReuseIdentifier: "news")

        view.addConstraints([
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sortIcon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: UIScreen.main.bounds.width * -0.05),
            sortIcon.bottomAnchor.constraint(equalTo: newsTableView.topAnchor)
        ])

        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPathForSelectedRow = newsTableView.indexPathForSelectedRow {
            newsTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }

    func indicatorInfo(for _: PagerTabStripViewController) -> IndicatorInfo {
        tabInfo
    }
}
