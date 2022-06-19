//
//  NewsCellView.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/14.
//

import MBCircularProgressBar
import UIKit

class NewsCellView: UITableViewCell {
    let deviceWidth = UIScreen.main.bounds.size.width

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: self.deviceWidth * 0.05)
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

    override init(style _: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        translatesAutoresizingMaskIntoConstraints = false
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(progressCircle)
        let paddingSize = deviceWidth * 0.05
        contentView.addConstraints([
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: paddingSize),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            progressCircle.rightAnchor.constraint(equalTo: rightAnchor, constant: paddingSize),
            progressCircle.centerYAnchor.constraint(equalTo: centerYAnchor),
            progressCircle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            progressCircle.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            heightAnchor.constraint(equalToConstant: titleLabel.bounds.size.height)

        ])
    }

    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCell(title: String, percentage: CGFloat) {
        titleLabel.text = title
        progressCircle.value = percentage
    }
}
