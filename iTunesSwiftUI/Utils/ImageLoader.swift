//
//  ImageLoader.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import UIKit
import Combine

final class ImageLoader: ObservableObject {
    
    enum ImageLoaderError: Error {
        case invalidData
    }
    
    private let url: URL
    
    private var cancellable: AnyCancellable?
    
    @Published var image: UIImage? = nil
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { data, _ -> UIImage in
                guard let image = UIImage(data: data) else {
                    throw ImageLoaderError.invalidData
                }
                
                return image
        }
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { error in
            debugPrint("Could not fetch image", error)
        }, receiveValue: { [weak self] image in
            self?.image = image
        })
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
}
