//
//  TrackDetailViewModel.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import Foundation
import Combine

protocol TrackDetailViewModelProtocol: class {
    var artistName: String { get }
    
    var trackName: String { get }
    
    var collectionName: String { get }
    
    var artworkURL: URL? { get }
    
    var previewURL: URL? { get }
}

final class TrackDetailViewModel: ObservableObject, TrackDetailViewModelProtocol {
    
    public var artistName: String {
        item.artistName
    }
    
    public var trackName: String {
        item.trackName ?? "Unknown Artist"
    }
    
    public var collectionName: String {
        item.collectionName ?? "Unknown Collection"
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
