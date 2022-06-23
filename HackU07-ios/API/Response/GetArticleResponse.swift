//
//  GetArticleResponse.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/23.
//

import Foundation

struct GetArticleResponse: Decodable {
    let title: String
    let url: String
    let score: Double
}
