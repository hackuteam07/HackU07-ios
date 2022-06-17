//
//  NewsCellView.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/14.
//

import ALProgressView
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

    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .progressGreen
        label.font = UIFont.systemFont(ofSize: self.deviceWidth * 0.03)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var progressCircle: ALProgressRing = {
        let view = ALProgressRing()
        view.startColor = .progressGreen
        view.endColor = .progressGreen
        view.grooveColor = .progressBackColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let buttomBorder: UIView = {
        let border = UIView()
        border.backgroundColor = .borderGray
        border.translatesAutoresizingMaskIntoConstraints = false
        return border
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(progressCircle)
        contentView.addSubview(percentLabel)
        contentView.addSubview(buttomBorder)
        let paddingSize = deviceWidth * 0.05
        contentView.autoresizingMask = .flexibleHeight
        let contentHeightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: deviceWidth * 0.25)
        contentHeightConstraint.priority = UILayoutPriority(rawValue: 750)
        contentView.addConstraints([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: paddingSize),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: deviceWidth * 0.6),
            progressCircle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -paddingSize),
            progressCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            progressCircle.widthAnchor.constraint(equalToConstant: deviceWidth * 0.2),
            progressCircle.heightAnchor.constraint(equalToConstant: deviceWidth * 0.2),
            percentLabel.centerYAnchor.constraint(equalTo: progressCircle.centerYAnchor),
            percentLabel.centerXAnchor.constraint(equalTo: progressCircle.centerXAnchor),
            buttomBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            buttomBorder.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            buttomBorder.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            buttomBorder.heightAnchor.constraint(equalToConstant: deviceWidth * 0.001),
            contentHeightConstraint

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
        progressCircle.setProgress(Float(percentage), animated: true)
        percentLabel.text = String(percentage * 100) + "%"
    }
}
