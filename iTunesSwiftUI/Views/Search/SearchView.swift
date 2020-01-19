//
//  SearchView.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import SwiftUI
import Combine

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: self.$viewModel.searchTerm, onSearchTermChanged: self.viewModel.onSearchTermChanged)
                
                Spacer()
                
                List(self.viewModel.results, id: \.id) { item in
                    NavigationLink(destination: TrackDetailView(item: item)) {
                        SearchCell(item: item)
                    }
                }
                .navigationBarTitle(Text("Search"), displayMode: .large)
            }
        }
    }
    
}

#if DEBUG
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
#endif
