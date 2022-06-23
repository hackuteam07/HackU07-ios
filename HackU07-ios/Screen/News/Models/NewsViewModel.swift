//
//  NewsViewModel.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/20.
//

import Combine
import Foundation

protocol FetchArticleUseCase {
    func fetchArticle() async throws -> [GetArticleResponse]
}

final class NewsViewModelImpl: NewsViewModel {
    var outputs: NewsViewModelOutputs { self }
    var inputs: NewsViewModelInputs { self }

    private let fetchArticleUseCase: FetchArticleUseCase

    private let requireReloadPublisher = PassthroughSubject<Void, Never>()
    private var newsCellContents: [NewsCellConents] = []

    init(fetchArticleUseCase: FetchArticleUseCase = FetchArticleUseCaseImpl()) {
        self.fetchArticleUseCase = fetchArticleUseCase
    }
}

extension NewsViewModelImpl: NewsViewModelOutputs {
    var requireReload: AnyPublisher<Void, Never> {
        requireReloadPublisher.eraseToAnyPublisher()
    }

    var cellContents: [NewsCellConents] {
        newsCellContents
    }
}

extension NewsViewModelImpl: NewsViewModelInputs {
    func fetchContents() {
        Task.detached { [weak self] in
            guard let strongSelf = self else { return }
            do {
                let articles = try await strongSelf.fetchArticleUseCase.fetchArticle()
                await MainActor.run {
                    strongSelf.newsCellContents = articles.map {
                        NewsCellConents(title: $0.title, percentage: Float($0.score).rounded4, url: URL(string: $0.url))
                    }
                    strongSelf.requireReloadPublisher.send()
                }
            } catch {
                // エラー処理
                print(error.localizedDescription)
            }
        }
    }
}
