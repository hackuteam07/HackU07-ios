//
//  WebViewController.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/18.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    private let url: URL

    lazy var webView: WKWebView = {
        let view = WKWebView(frame: view.bounds)
        let request = URLRequest(url: url)
        view.load(request)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.backgroundColor = .baseBlack
        view.addConstraints([
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.9)
        ])
    }
}
