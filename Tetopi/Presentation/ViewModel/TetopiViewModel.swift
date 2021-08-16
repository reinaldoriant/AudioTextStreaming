//
//  TetopiViewModel.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 12/08/21.
//

import Foundation

class TetopiViewModel : ObservableObject {
    @Published var showPlayer = false
    @Published private(set) var dataTetopi: TetopiModel?
   
    func apaIni(){
        
    }
    func insertDataTetopi(data: TetopiModel){
        //print(data,"apa ini?")
        self.dataTetopi = data
        self.showPlayer = true
    }
}
