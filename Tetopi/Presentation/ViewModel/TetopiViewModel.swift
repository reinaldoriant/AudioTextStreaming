//
//  TetopiViewModel.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 12/08/21.
//

import Foundation
import SwiftAudioPlayer

class TetopiViewModel : ObservableObject {
    //Data properties
    @Published private(set) var dataTetopi: TetopiModel?
    
    //UI Properties
    @Published var showPlayer = false
    @Published var expandFuper = false
    @Published var heightPhone = 0
    
    //Audio Control

    
    @Published var isPlaying : Bool = false
    var durationId: UInt?
    var elapsedID: UInt?
    
    @Published var elapsedTime: String = ""
    @Published var durationTime: String = ""
    @Published var valueDurationSlider: Float = 0.0
    @Published var valueSlider: Float = 0.0

    
    func insertDataTetopi(data: TetopiModel){
        self.dataTetopi = data
    }
    
    // MARK: - Private

    func initializeTetopi(){
        setupAudio()
        durationAndSlider()
    }
    func setupAudio(){
        
        let url = URL(string: dataTetopi?.audio ?? "")!
        SAPlayer.shared.startRemoteAudio(withRemoteUrl: url)
        SAPlayer.shared.play()
        isPlaying = true
    }
    
    func playPause() {
        if isPlaying == true {
            SAPlayer.shared.pause()
            
        } else {
            SAPlayer.shared.play()
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
    
    func durationAndSlider() {
        durationId = SAPlayer.Updates.Duration.subscribe { (url, duration) in
            self.durationTime = SAPlayer.prettifyTimestamp(duration)
            self.valueDurationSlider = Float(duration)
            print("kamu siapa nilaimu berapa? \(duration)")
        }
        elapsedID = SAPlayer.Updates.ElapsedTime.subscribe {(url, position) in
            self.elapsedTime = SAPlayer.prettifyTimestamp(position)
            self.valueSlider = Float(position)
        }
//        let value = Double(elapsedTime)!
//        SAPlayer.shared.seekTo(seconds: value)
    }
    
    func skipForward15(){
        SAPlayer.shared.skipForward()
    }
    
    func skipBackward15(){
        SAPlayer.shared.skipBackwards()
    }
}

