//
//  TrackDetailView.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import SwiftUI

struct TrackDetailView: View {
    
    @ObservedObject var viewModel: TrackDetailViewModel
        
    init(item: SearchResultItem) {
        self.viewModel = TrackDetailViewModel(item: item)
    }
    
    var body: some View {
        VStack {
            Text(viewModel.artistName)
                .font(.title)
                .padding([.leading, .trailing], 16)
                .multilineTextAlignment(.center)
            
            Text(viewModel.collectionName)
                .font(.headline)
                .padding(.top, 8)
                .multilineTextAlignment(.center)
            
            Text(viewModel.trackName)
                .font(.caption)
                .padding(.top, 8)
            
            if viewModel.artworkURL != nil {
                ImageView(url: viewModel.artworkURL!)
                    .frame(width: 100, height: 100, alignment: .center)
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(16)
                    .padding(.top, 24)
            }
            
            Spacer()

            if viewModel.previewURL != nil {
                PlayerView(url: viewModel.previewURL!)
                    .padding(.bottom, 32)
            }
        }
    }
    
}
