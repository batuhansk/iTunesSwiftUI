//
//  ImageView.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: URL) {
        self.imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        ZStack {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
            }
        }
        .onAppear(perform: imageLoader.load)
        .onDisappear(perform: imageLoader.cancel)
    }
    
}

