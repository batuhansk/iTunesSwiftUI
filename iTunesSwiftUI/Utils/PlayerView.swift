//
//  PlayerView.swift
//  iTunesSwiftUI
//
//  Created by Batuhan Saka on 8.01.2020.
//  Copyright © 2020 Batuhan Saka. All rights reserved.
//

import AVFoundation
import SwiftUI

struct PlayerView: View {
    
    @State private var isPlaying: Bool = false
            
    private let avPlayer: AVPlayer
    
    init(url: URL) {
        self.avPlayer = AVPlayer(url: url)
    }
    
    var body: some View {
        VStack {
            Text("Track Preview")
                .font(.headline)
            
            HStack {
                Button(action: togglePlayerState) {
                    isPlaying ?
                        Image(systemName: "pause.circle.fill").resizable() :
                        Image(systemName: "play.circle.fill").resizable()
                }
                .frame(width: 64, height: 64, alignment: .center)
            }
            .padding(.top, 16)
        }
        .onAppear(perform: playAVPlayer)
        .onDisappear(perform: pauseAVPlayer)
    }
    
    private func togglePlayerState() {
        isPlaying.toggle()
        
        if isPlaying {
            playAVPlayer()
        } else {
            pauseAVPlayer()
        }
    }
    
    private func playAVPlayer() {
        isPlaying = true
        
        avPlayer.play()
    }
    
    private func pauseAVPlayer() {
        isPlaying = false
        
        avPlayer.pause()
    }
    
}
