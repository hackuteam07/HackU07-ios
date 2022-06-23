//
//  APIProvider.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/23.
//

import Foundation
import Moya

typealias APIProvider = MoyaProvider<MultiTarget>

protocol OmeletteRiceAPIProvider {
    func exec<T: OmeletteRiceAPI>(request: T) async throws -> T.Response
}

final class OmeletteRiceAPIProviderImpl: APIProvider, OmeletteRiceAPIProvider {
    func exec<T: OmeletteRiceAPI>(request: T) async throws -> T.Response {
        try await withCheckedThrowingContinuation { continutation in
            let target = MultiTarget(request)
            self.request(target) { result in
                switch result {
                case let .success(result):
                    do {
                        let response = try request.decode(from: result)
                        continutation.resume(returning: response)
                    } catch {
                        continutation.resume(throwing: error)
                    }
                case let .failure(error):
                    continutation.resume(throwing: error)
                }
            }
        }
    }
}
