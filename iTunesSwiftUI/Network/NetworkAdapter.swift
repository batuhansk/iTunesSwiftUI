//
//  NetworkAdapter.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation
import Combine

final class NetworkAdapter {
    
    struct Response<T> {
        let value: T
    }
    
    private var session: URLSession {
        URLSession.shared
    }
    
    private func buildRequest(_ endpoint: iTunesAPI) -> URLRequest? {
        guard var components = URLComponents(string: endpoint.baseURL) else {
            return nil
        }

        components.path = endpoint.path
        components.queryItems = endpoint.parameters.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
                
        guard let url = components.url else {
            return nil
        }
        
        return URLRequest(url: url)
    }
    
    public func execute<T: Decodable>(_ endpoint: iTunesAPI, dataType: T.Type, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, NetworkError> {
        guard let request = buildRequest(endpoint) else {
            return Fail(error: .invalidRequest).eraseToAnyPublisher()
        }
        
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value)
            }
            .mapError { error -> NetworkError in
                switch error {
                    case is DecodingError: return .decodingError(error)
                    case is URLError: return .urlError(error)
                    default: return .unknown(error)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
