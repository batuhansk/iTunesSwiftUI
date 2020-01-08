//
//  iTunesAPI.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation

public enum iTunesAPI {
    case search(term: String)
}

extension iTunesAPI: Endpoint {
    
    public var baseURL: String {
        return "https://itunes.apple.com"
    }
    
    public var path: String {
        return "/search"
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var parameters: Parameters {
        switch self {
        case .search(let term):
            var parameters = Parameters()
            parameters["term"] = term
            parameters["entity"] = "musicTrack"
            return parameters
        }
    }
    
}
