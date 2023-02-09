//
//  HomeViewModel.swift
//  GoogleBookAPI
//
//  Created by Anis on 09/02/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    var cancellable: [AnyCancellable] = []
    var keyword: String = ""
    var author: String = ""
    @Published var results: GBSearchModel?

    func search() {
        let request = GBEndpoint.search(keyword, author).request

        URLSession.shared.dataTaskPublisher(for: request)
            .map {$0.data}
            .decode(type: GBSearchModel?.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .replaceError(with: nil)
            .assign(to: \.results, on: self)
            .store(in: &cancellable)
    }
}
