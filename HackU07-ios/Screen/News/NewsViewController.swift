//
//  ViewController.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/13.
//

import Combine
import UIKit
import XLPagerTabStrip

protocol NewsViewModelOutputs: NewsTableViewOutputs {}

protocol NewsViewModelInputs {
    func fetchContents()
}

@MainActor
protocol NewsViewModel {
    var outputs: NewsViewModelOutputs { get }
    var inputs: NewsViewModelInputs { get }
}

class NewsViewController: UIViewController, IndicatorInfoProvider {
    private let viewModel: NewsViewModel
    var tabInfo: IndicatorInfo = "Yahoo!ニュース"
    lazy var newsTableView = NewsTableView(outputs: viewModel.outputs)
    lazy var sortIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "SortIcon"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        viewModel.inputs.fetchContents()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPathForSelectedRow = newsTableView.indexPathForSelectedRow {
            newsTableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
    }

    private func setupUI() {
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

    func indicatorInfo(for _: PagerTabStripViewController) -> IndicatorInfo {
        tabInfo
    }
}
