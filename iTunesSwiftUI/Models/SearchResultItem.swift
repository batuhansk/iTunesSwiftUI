//
//  SearchResultItem.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import SwiftUI

public struct SearchResultItem: Identifiable, Decodable {
    
    public let id = UUID()
    
    var readableDuration: String? {
        let formatter = DateComponentsFormatter.default
        
        let durationInSeconds = TimeInterval(durationInMilliseconds / 1000)
        
        return formatter.string(from: durationInSeconds)
    }
    
    let artistName: String
    let collectionName: String?
    let trackName: String?
    let previewURL: URL?
    let artworkURL: URL?
    
    private let durationInMilliseconds: Int
    
    private enum CodingKeys: String, CodingKey {
        case artistName
        case collectionName
        case trackName
        case previewURL = "previewUrl"
        case artworkURL = "artworkUrl100"
        case durationInMilliseconds = "trackTimeMillis"
    }
    
}
