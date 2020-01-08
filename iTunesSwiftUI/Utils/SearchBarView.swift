//
//  SearchBarView.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    
    @Binding var text: String
        
    var onSearchTermChanged: (() -> Void)?
    
    func makeUIView(context: Context) -> UISearchBar {
        let uiView = UISearchBar(frame: .zero)
        uiView.delegate = context.coordinator
        return uiView
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarView>) {
        uiView.placeholder = "Search"
        uiView.showsCancelButton = false
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        let uiView: SearchBarView
        
        init(_ uiView: SearchBarView) {
            self.uiView = uiView
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            uiView.text = searchText
            
            uiView.onSearchTermChanged?()
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.endEditing(true)
        }
        
    }
    
}
