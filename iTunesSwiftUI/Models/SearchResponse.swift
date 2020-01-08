//
//  SearchResponse.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation

public struct SearchResponse: Decodable {
    let resultCount: Int
    let results: [SearchResultItem]
}
