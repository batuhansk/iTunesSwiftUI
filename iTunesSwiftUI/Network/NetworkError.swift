//
//  NetworkError.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case invalidRequest
    case urlError(Error)
    case decodingError(Error)
    case unknown(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidRequest:
            return "Invalid request"
        case .urlError(let error):
            return "URL error \(error.localizedDescription)"
        case .decodingError(let error):
            return "Decoding error \(error.localizedDescription)"
        case .unknown(let error):
            return "Unknown error \(error.localizedDescription)"
        }
    }
}
