//
//  FetchArticleUseCase.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/24.
//

import Foundation

final class FetchArticleUseCaseImpl: FetchArticleUseCase {
    private let provider: OmeletteRiceAPIProvider

    init(provider: OmeletteRiceAPIProvider = OmeletteRiceAPIProviderImpl()) {
        self.provider = provider
    }

    func fetchArticle() async throws -> [GetArticleResponse] {
        try await provider.exec(request: GetArticleReauest())
    }
}
