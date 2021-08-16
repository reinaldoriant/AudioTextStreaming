//
//  TetopiViewModel.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 12/08/21.
//

import Foundation
import AVFoundation

class TetopiViewModel : ObservableObject {
    //Data properties
    @Published private(set) var dataTetopi: TetopiModel?
    
    //UI Properties
    @Published var showPlayer = false
    @Published var expandFuper = false
    @Published var heightPhone = 0
    
    //Audio Control
    @Published var isPlaying : Bool = false
    @Published var player = AVPlayer()
   
    func insertDataTetopi(data: TetopiModel){
        self.dataTetopi = data
    }
    
    func playAudio(){
        let _ = print("kamu ini apa \(String(describing: dataTetopi?.audio))")
        guard let url = URL.init(string: dataTetopi?.audio ?? "Audio kosong") else { return }
        let playerItem = AVPlayerItem.init(url: url)
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        player = AVPlayer.init(playerItem: playerItem)
        player.play()
        isPlaying=true
    }
    
    func playPause() {
        if isPlaying == true {
            player.pause()
        } else {
            player.play()
        }
        self.isPlaying.toggle()
    }
    
//    func next() {
//        if let currentIndex = dataTetopi.firstIndex(of: audio){
//            if currentIndex == album.songs.count - 1{
//            }
//            else{
//                player.pause()
//                song = album.songs[currentIndex + 1]
//                self.playAudio()
//            }
//
//        }
//    }
//
//    func previous() {
//        if let currentIndex = album.songs.firstIndex(of: song){
//            if currentIndex == 0 {
//            }
//            else{
//                player.pause()
//                song = album.songs[currentIndex - 1]
//                self.playAudio()
//            }
//
//        }
//    }
}
