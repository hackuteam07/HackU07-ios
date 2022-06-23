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
    private let isLoadingPublisher = PassthroughSubject<Bool, Never>()
    private let showAlertPublisher = PassthroughSubject<String, Never>()
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

    var isLoading: AnyPublisher<Bool, Never> {
        isLoadingPublisher.eraseToAnyPublisher()
    }

    var showAlert: AnyPublisher<String, Never> {
        showAlertPublisher.eraseToAnyPublisher()
    }
}

extension NewsViewModelImpl: NewsViewModelInputs {
    func fetchContents() {
        isLoadingPublisher.send(true)
        Task.detached { [weak self] in
            guard let strongSelf = self else { return }
            do {
                let articles = try await strongSelf.fetchArticleUseCase.fetchArticle()
                await MainActor.run {
                    strongSelf.newsCellContents = articles.map {
                        NewsCellConents(title: $0.title, percentage: Float($0.score).rounded4, url: URL(string: $0.url))
                    }
                    strongSelf.requireReloadPublisher.send()
                    strongSelf.isLoadingPublisher.send(false)
                }
            } catch {
                await MainActor.run {
                    strongSelf.showAlertPublisher.send(error.localizedDescription)
                    strongSelf.isLoadingPublisher.send(false)
                }
            }
        }
    }
}
