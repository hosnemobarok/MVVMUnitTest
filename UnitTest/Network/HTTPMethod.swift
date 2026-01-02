//
//  HTTPMethod.swift
//  NewsExplorer
//
//  Created by Md Hosne Mobarok on 1/1/26.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

struct APIRequest {
    let urlString: String
    let method: HTTPMethod
    let headers: [String: String]?
    let body: Data?

    init(urlString: String, method: HTTPMethod = .get, headers: [String: String]? = nil, body: Data? = nil) {
        self.urlString = urlString
        self.method = method
        self.headers = headers
        self.body = body
    }

    func buildURLRequest() throws -> URLRequest {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        return request
    }
}
