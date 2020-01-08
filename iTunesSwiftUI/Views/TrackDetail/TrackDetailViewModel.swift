//
//  TrackDetailViewModel.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation
import Combine

final class TrackDetailViewModel: ObservableObject {
    
    public var artistName: String {
        item.artistName
    }
    
    public var trackName: String? {
        item.trackName
    }
    
    public var collectionName: String? {
        item.collectionName
    }
    
    public var artworkURL: URL? {
        item.artworkURL
    }
    
    public var previewURL: URL? {
        item.previewURL
    }
    
    private let item: SearchResultItem
    
    init(item: SearchResultItem) {
        self.item = item
    }
    
}
