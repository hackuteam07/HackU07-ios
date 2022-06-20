//
//  NewsViewModel.swift
//  HackU07-ios
//
//  Created by Etsushi Otani on 2022/06/20.
//

import Combine
import Foundation

final class NewsViewModelImpl: NewsViewModel {
    var outputs: NewsViewModelOutputs { self }
    var inputs: NewsViewModelInputs { self }

    private let requireReloadPublisher = PassthroughSubject<Void, Never>()
    private var newsCellContents: [NewsCellConents] = []

    init() {}
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
        newsCellContents = NewsCellConents.mockDatas
        requireReloadPublisher.send()
    }
}
