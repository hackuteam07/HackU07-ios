//
//  NewsCellContents.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/20.
//

import Foundation

struct NewsCellConents {
    let title: String
    let percentage: Float
    let url: URL

    static let mockDatas: [NewsCellConents] = [
        NewsCellConents(title: "政府・日銀、為替介入にハードル　米当局はドル高容認", percentage: 0.95, url: URL(string: "https://news.yahoo.co.jp/articles/94c838977429911a305099b85b05885e87499f7a")!)
    ]
}
