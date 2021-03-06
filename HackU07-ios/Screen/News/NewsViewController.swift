//
//  ViewController.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/13.
//

import Combine
import UIKit
import XLPagerTabStrip

protocol NewsViewModelOutputs: NewsTableViewOutputs {
    var isLoading: AnyPublisher<Bool, Never> { get }
    var showAlert: AnyPublisher<String, Never> { get }
}

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
    private var cancellables = Set<AnyCancellable>()
    var tabInfo: IndicatorInfo = "Yahoo!ニュース"
    lazy var newsTableView = NewsTableView(outputs: viewModel.outputs)
    lazy var sortIcon: UIImageView = {
        let view = UIImageView(image: UIImage(named: "SortIcon"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var loadingIndicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.style = .large
        indicatorView.color = .white
        indicatorView.center = view.center
        return indicatorView
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
        bind()
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
        view.addSubview(loadingIndicatorView)
        view.bringSubviewToFront(loadingIndicatorView)
        newsTableView.register(NewsCellView.self, forCellReuseIdentifier: "news")

        view.addConstraints([
            newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sortIcon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: UIScreen.main.bounds.width * -0.05),
            sortIcon.bottomAnchor.constraint(equalTo: newsTableView.topAnchor)
        ])
        newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func bind() {
        viewModel.outputs.isLoading
            .sink(receiveValue: { [weak self] isLoading in
                self?.loadingIndicatorView.updateStatus(isLoading)
            })
            .store(in: &cancellables)
        viewModel.outputs.showAlert
            .sink(receiveValue: { [weak self] message in
                let alert = UIAlertController.errorAlert(message: message)
                self?.present(alert, animated: true)
            })
            .store(in: &cancellables)
    }

    func indicatorInfo(for _: PagerTabStripViewController) -> IndicatorInfo {
        tabInfo
    }
}
