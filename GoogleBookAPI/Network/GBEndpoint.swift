//
//  GBEndpoint.swift
//  GoogleBookAPI
//
//  Created by Anis on 06/02/2023.
//

import Foundation

enum GBEndpoint {

    case search(String, String? = nil)

    private var fullPath: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.googleapis.com"

        switch self {
            case .search(let value, let author):
                components.path = "/books/v1/volumes"
                var searchValue = value
                if let author {
                    searchValue.append("+inauthor:" + author)
                }
                components.queryItems = [
                    URLQueryItem(name: "q", value: searchValue)
                ]
        }
        return components
    }

    private enum HTTPMethod: String {
        case post = "POST"
        case get = "GET"
    }

    private var method: HTTPMethod {
        switch self {
            default:
                return .get
        }
    }

    var request: URLRequest {
        guard let url = fullPath.url else {
            print(fullPath.url ?? "fullPath")
            fatalError()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}
