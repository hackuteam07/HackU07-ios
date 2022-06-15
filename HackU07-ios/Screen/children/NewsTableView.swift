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
        cell.setCell(title: data[indexPath.row]["title"] as? String ?? "not found" , percentage: data[indexPath.row]["percentage"] as? CGFloat ??  0.0 )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
        }
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([
            self.heightAnchor.constraint(equalToConstant: screenHeight * 0.7),
            self.widthAnchor.constraint(equalToConstant: screenWidth)
        ])
    }
}
