//
//  FetchArticleUseCase.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/24.
//

import Foundation

final class FetchNewsUseCaseImpl: FetchNewsUseCase {
    private let provider: OmeletteRiceAPIProvider

    init(provider: OmeletteRiceAPIProvider = OmeletteRiceAPIProviderImpl()) {
        self.provider = provider
    }

    func fetchNews() async throws -> [News] {
        try await provider.exec(request: GetNewsReauest())
    }
}
