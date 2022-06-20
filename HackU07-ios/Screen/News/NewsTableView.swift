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
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    let data = mockData().data

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news") as! NewsCellView
        cell.setCell(title: data[indexPath.row]["title"] as? String ?? "not found", percentage: CGFloat?(data[indexPath.row]["percentage"] as! Double) ?? 0.0)
        return cell
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        data.count
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = WebViewController()
        webView.url = data[indexPath.row]["url"] as? String ?? "https://www.google.com"
        if let superVC = parentViewController() as? NewsViewController {
            superVC.navigationController?.pushViewController(webView, animated: true)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            heightAnchor.constraint(equalToConstant: .newsTableViewHeight),
            widthAnchor.constraint(equalToConstant: .deviceWidth)
        ])
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
