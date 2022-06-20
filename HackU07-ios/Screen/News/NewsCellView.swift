//
//  NewsCellView.swift
//  HackU07-ios
//
//  Created by 有賀優太 on 2022/06/14.
//

import ALProgressView
import UIKit

class NewsCellView: UITableViewCell {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: .titleTextSize)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .progressGreen
        label.font = UIFont.systemFont(ofSize: .percentageTextSize)
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
        contentView.autoresizingMask = .flexibleHeight
        let contentHeightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: .deviceWidth * 0.25)
        contentHeightConstraint.priority = UILayoutPriority(rawValue: 750)
        contentView.addConstraints([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: .paddingSize),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: .deviceWidth * 0.6),
            progressCircle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: .paddingSize * -1),
            progressCircle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            progressCircle.widthAnchor.constraint(equalToConstant: .deviceWidth * 0.2),
            progressCircle.heightAnchor.constraint(equalToConstant: .deviceWidth * 0.2),
            percentLabel.centerYAnchor.constraint(equalTo: progressCircle.centerYAnchor),
            percentLabel.centerXAnchor.constraint(equalTo: progressCircle.centerXAnchor),
            buttomBorder.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            buttomBorder.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            buttomBorder.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            buttomBorder.heightAnchor.constraint(equalToConstant: .tableSeparatorWidth),
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

    func setCell(title: String, percentage: Float) {
        titleLabel.text = title
        progressCircle.setProgress(percentage, animated: true)
        percentLabel.text = String(percentage * 100) + "%"
    }
}
