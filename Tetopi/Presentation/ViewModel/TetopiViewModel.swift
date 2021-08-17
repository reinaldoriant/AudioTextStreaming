//
//  TetopiViewModel.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 12/08/21.
//

import Foundation
import SwiftAudioPlayer
import SwiftUI

class TetopiViewModel : ObservableObject {
    //Data properties
    @Published private(set) var dataTetopi: TetopiModel?
    
    //UI Properties
    @Published var showPlayer = false
    @Published var expandFuper = false
    @Published var isClosingTetopi = false
    @Published var showSpinnerPlayback = false
    @Published var isSpinnerChanged = false
    
    @Published var heightPhoneType = ""
    @Published var heightTopFuper: CGFloat = 0
    @Published var heightComperFromDashboard = 0
    @Published var offsetFuper : CGFloat = 0
    @Published var speedRateName: String = ""
    
    @Published var categoryToString: String = ""
    @Published var titleToString: String = ""

    
    //Audio Control
    @Published var isPlaying : Bool = false
    var durationId: UInt?
    var elapsedID: UInt?
    @Published var elapsedTime: String = ""
    @Published var durationTime: String = ""
    @Published var valueDurationSlider: Float = 0.0
    @Published var valueCurrentSlider: Float = 0.0
    @Published var valueDurationSliderComper: CGFloat = 0.0
    @Published var valueCurrentSliderComper: CGFloat = 0.0


    func initializeTetopi(){
        heightPhoneTetopi()
        convertHtmlToString()
        setupAudio()
        durationAndSliderAudio()
        self.isClosingTetopi = false
        self.isSpinnerChanged = false
    }
    
    func convertHtmlToString(){
        DispatchQueue.main.async {
            self.categoryToString = self.dataTetopi?.category.html2String ?? ""
            self.titleToString = self.dataTetopi?.title.html2String ?? ""
        }
    }
    
    func heightPhoneTetopi(){
        if heightPhoneType == "TypeX" {
            self.heightTopFuper = 58
            self.heightComperFromDashboard = -60
        }
        else {
            self.heightTopFuper = 32
            self.heightComperFromDashboard = -60
        }
        
    }
    
    func insertDataTetopi(data: TetopiModel){
        self.dataTetopi = data
    }
    
    func setupAudio(){
        
        let url = URL(string: dataTetopi?.audio ?? "")!
        SAPlayer.shared.startRemoteAudio(withRemoteUrl: url)
        SAPlayer.shared.play()
        isPlaying = true
    }
    
    func playPauseAudio() {
        if isPlaying == true {
            SAPlayer.shared.pause()
            
        } else {
            SAPlayer.shared.play()
        }
        self.isPlaying.toggle()
    }
    
    func stopAudio(){
        SAPlayer.shared.stopStreamingRemoteAudio()
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
    
    func durationAndSliderAudio() {
        durationId = SAPlayer.Updates.Duration.subscribe { (url, duration) in
            self.durationTime = SAPlayer.prettifyTimestamp(duration)
            self.valueDurationSlider = Float(duration)
            self.valueDurationSliderComper = CGFloat(duration)
        }
        elapsedID = SAPlayer.Updates.ElapsedTime.subscribe {(url, position) in
            self.elapsedTime = SAPlayer.prettifyTimestamp(position)
            self.valueCurrentSlider = Float(position)
            self.valueCurrentSliderComper = CGFloat(position)
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
    
    func rateSpeedAudio(name: String, speed: Float){
        SAPlayer.shared.rate = speed
        self.showSpinnerPlayback = false
        self.speedRateName = name
        self.isSpinnerChanged = true
    }
}

