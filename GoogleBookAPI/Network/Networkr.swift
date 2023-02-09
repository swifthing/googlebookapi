//
//  Networkr.swift
//  GoogleBookAPI
//
//  Created by Anis on 06/02/2023.
//

import Foundation
import Combine

class Networkr<T: Codable>: ObservableObject {
    private var request: URLRequest
    private var cancellable: AnyCancellable?
    private var session: URLSession
    @Published var result: T?

    init (_ request: URLRequest) {
        self.request = request
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        self.session = URLSession(configuration: config)
        get()
    }

    func get () {
        cancellable = session.dataTaskPublisher(for: request)
            .map {$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                    case .failure(let error):
                        print(self?.request ?? "no request", error)
                    default: break
                }
            }, receiveValue: { [weak self] data in
                self?.result = data
            })
    }
}
