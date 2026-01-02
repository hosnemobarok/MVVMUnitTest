//
//  AppConfiguration.swift
//  UnitTest
//
//  Created by Md Hosne Mobarok on 1/2/26.
//

import UIKit

struct AppConfiguration {

    // MARK: - Environment
    static let environment: AppEnvironment = {
        #if DEBUG
        return .dev
        #elseif QA
        return .qa
        #else
        return .production
        #endif
    }()

    // MARK: - Base URL
    static var apiBaseURL: URL {
        let urlString: String
        switch environment {
        case .dev:
            urlString = "https://jsonplaceholder.typicode.com"
        case .qa:
            urlString = "https://jsonplaceholder.typicode.com"
        case .production:
            urlString = "https://jsonplaceholder.typicode.com"
        }

        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL string: \(urlString)")
        }
        return url
    }

    // MARK: - API Key
    static var apiKey: String {
        return "d48fffb4ba90462eb4b4e8f101d5440a"
    }

    // MARK: - Endpoints
    enum APIEndpoints {
        static let users = "/users"
    }
}
