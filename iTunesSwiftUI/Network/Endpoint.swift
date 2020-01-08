//
//  Endpoint.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol Endpoint {
    var baseURL: String { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var parameters: Parameters { get }
}
