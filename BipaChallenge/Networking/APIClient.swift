//
//  APIClient.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 14/01/26.
//

import Foundation
import Combine

final class APIClient {
    
    func nodes() -> AnyPublisher<[Node], APIError> {
        request(.nodes)
    }
    
    private func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
        URLSession.shared.dataTaskPublisher(for: endpoint.request)
            .tryMap { data, response -> T in
                guard
                    let response = response as? HTTPURLResponse,
                    (200..<300).contains(response.statusCode)
                else {
                    throw APIError.failedRequest
                }
                
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw APIError.responseInvalid
                }
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError:
                    return apiError
                case URLError.notConnectedToInternet:
                    return APIError.unreachable
                default:
                    return APIError.failedRequest
                }
            }
            .eraseToAnyPublisher()
    }
}
