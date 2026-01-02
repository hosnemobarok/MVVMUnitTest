//
//  NetworkError.swift
//  NewsExplorer
//
//  Created by Md Hosne Mobarok on 1/1/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL, offline, nullData, decodingFailed(String), timeout
    case serverError(statusCode: Int), undefined

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .offline: return "No internet connection."
        case .nullData: return "Server returned no data."
        case .decodingFailed(let msg): return "Decoding failed: \(msg)"
        case .timeout: return "Request timed out."
        case .serverError(let code): return "Server error: \(code)"
        case .undefined: return "An undefined error occurred."
        }
    }
}
