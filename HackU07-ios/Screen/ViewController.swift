//
//  ViewController.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/13.
//

import UIKit

class ViewController: UIViewController {
    lazy var newsTableView = NewsTableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .baseBlack
        view.addSubview(newsTableView)
        newsTableView.register(NewsCellView.self, forCellReuseIdentifier: "news")

        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override func viewWillAppear(_: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidDisappear(_: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}
