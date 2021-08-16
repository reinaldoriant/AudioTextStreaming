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
    
    //UI Properties
    @Published var expandFuper = false
    @Published var heightPhone = 0
   
    func insertDataTetopi(data: TetopiModel){
        self.dataTetopi = data
    }
}
