//
//  SearchCell.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import SwiftUI

struct SearchCell: View {
    
    private let item: SearchResultItem
    
    init(item: SearchResultItem) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            if item.artworkURL != nil {
                ImageView(url: item.artworkURL!)
                    .frame(width: 64, height: 64, alignment: .center)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                if item.trackName != nil {
                    Text(item.trackName!)
                        .font(.body)
                }
                                
                Text(item.artistName)
                    .font(.caption)
                    .padding(.top, 8)
            }
            
            Spacer()
            
            if item.readableDuration != nil {
                Text(item.readableDuration!)
                    .font(.footnote)
            }
        }
        
    }
}
