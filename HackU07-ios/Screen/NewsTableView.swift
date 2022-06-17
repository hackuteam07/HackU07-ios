//
//  NewsTableView.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/15.
//

import UIKit

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
            heightAnchor.constraint(equalToConstant: screenHeight * 0.7),
            widthAnchor.constraint(equalToConstant: screenWidth)
        ])
    }
}
