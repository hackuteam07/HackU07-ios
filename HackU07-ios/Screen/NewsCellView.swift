//
//  NewsCellView.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/14.
//

import UIKit
import MBCircularProgressBar

class NewsCellView: UITableViewCell {
    
    let deviceWidth = UIScreen.main.bounds.size.width
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: self.deviceWidth*0.05)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var progressCircle: MBCircularProgressBarView = {
        let view = MBCircularProgressBarView()
        view.progressAngle = 0
        view.progressColor = .progressGreen
        view.emptyLineColor = .progressBackColor
        view.progressCapType = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(progressCircle)
        let paddingSize = deviceWidth*0.05
        self.addConstraints([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: paddingSize),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            progressCircle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: paddingSize),
            progressCircle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            progressCircle.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            progressCircle.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(title: String, percentage: CGFloat) {
        titleLabel.text = title
        progressCircle.value = percentage
    }
    
}
