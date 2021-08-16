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
   
    func insertDataTetopi(data: TetopiModel){
        self.dataTetopi = data
    }
}
