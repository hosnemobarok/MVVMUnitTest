//
//  NetworkManager.swift
//  NewsExplorer
//
//  Created by Md Hosne Mobarok on 1/1/26.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 60
        return URLSession(configuration: config)
    }()

    func request(_ apiRequest: APIRequest,
                 completion: @escaping (NetworkResult<Data, NetworkError>) -> Void) {
        do {
            let urlRequest = try apiRequest.buildURLRequest()
            session.dataTask(with: urlRequest) { data, response, error in
                if let error = error as NSError? {
                    switch error.code {
                    case NSURLErrorNotConnectedToInternet: completion(.failure(.offline))
                    case NSURLErrorTimedOut: completion(.failure(.timeout))
                    default: completion(.failure(.undefined))
                    }
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                    completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                    return
                }

                guard let data = data else { completion(.failure(.nullData)); return }
                completion(.success(data))
            }.resume()
        } catch let error as NetworkError {
            completion(.failure(error))
        } catch {
            completion(.failure(.undefined))
        }
    }

    func decode<T: Decodable>(_ type: T.Type,
                               from data: Data,
                               completion: @escaping (NetworkResult<T, NetworkError>) -> Void) {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            completion(.success(model))
        } catch {
            completion(.failure(.decodingFailed(error.localizedDescription)))
        }
    }

    func fetch<T: Decodable>(_ request: APIRequest,
                             model: T.Type,
                             completion: @escaping (NetworkResult<T, NetworkError>) -> Void) {
        self.request(request) { result in
            switch result {
            case .success(let data): self.decode(T.self, from: data, completion: completion)
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}
