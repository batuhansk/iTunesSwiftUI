//
//  SearchViewModel.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
        
    @Published var results: [SearchResultItem] = []
    
    private var disposeBag = Set<AnyCancellable>()
    
    private let adapter = NetworkAdapter()
    
    private let searchSubject = PassthroughSubject<Void, NetworkError>()
    
    var searchTerm: String = ""
    
    init() {
        searchSubject.flatMap {
            self.adapter.execute(.search(term: self.searchTerm), dataType: SearchResponse.self)
        }
        .debounce(for: .seconds(1), scheduler: RunLoop.main)
        .subscribe(on: RunLoop.main)
        .replaceError(with: NetworkAdapter.Response<SearchResponse>(value: SearchResponse(resultCount: 0, results: [])))
        .sink(receiveValue: { [weak self] response in
            self?.results = response.value.results
        })
        .store(in: &disposeBag)
    }
    
    func onSearchTermChanged() {
        searchSubject.send(())
    }
    
}
