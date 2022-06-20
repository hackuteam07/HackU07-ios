//
//  NewsTableView.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/15.
//

import Combine
import UIKit

protocol NewsTableViewOutputs {
    var requireReload: AnyPublisher<Void, Never> { get }
    var cellContents: [NewsCellConents] { get }
}

class NewsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    private let outputs: NewsTableViewOutputs
    private var cancellables = Set<AnyCancellable>()
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news") as! NewsCellView
        let content = outputs.cellContents[indexPath.row]
        cell.setCell(title: content.title, percentage: content.percentage)
        return cell
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        outputs.cellContents.count
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = WebViewController()
        let content = outputs.cellContents[indexPath.row]
        webView.url = content.url
        if let superVC = parentViewController() as? NewsViewController {
            superVC.navigationController?.pushViewController(webView, animated: true)
        }
    }

    init(outputs: NewsTableViewOutputs) {
        self.outputs = outputs
        super.init(frame: .zero, style: .plain)
        delegate = self
        dataSource = self
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: .newsTableViewHeight),
            widthAnchor.constraint(equalToConstant: .deviceWidth)
        ])
        bind()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bind() {
        outputs.requireReload
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                self?.reloadData()
            })
            .store(in: &cancellables)
    }
}

extension UITableView {
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }

    func parentView<T: UIView>(type _: T.Type) -> T? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let view = nextResponder as? T {
                return view
            }
            parentResponder = nextResponder
        }
    }
}
