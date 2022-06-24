//
//  GetArticleRequest.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/23.
//

import Foundation
import Moya

struct GetNewsReauest {}

extension GetNewsReauest: OmeletteRiceAPI {
    typealias Response = [News]

    var path: String {
        "/"
    }

    var method: Moya.Method {
        .get
    }

    var task: Task {
        .requestPlain
    }
}
