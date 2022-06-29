//
//  OmeletteRiceAPI.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/23.
//

import Foundation
import Moya

protocol OmeletteRiceAPI: TargetType {
    associatedtype Response: Decodable
    func decode(from result: Moya.Response) throws -> Response
}

extension OmeletteRiceAPI {
    var baseURL: URL {
        URL(string: "https://hacku7-server-web-zszjj7cu4q-an.a.run.app")!
    }

    var headers: [String: String]? {
        nil
    }

    func decode(from result: Moya.Response) throws -> Response {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(Response.self, from: result.data)
    }
}
