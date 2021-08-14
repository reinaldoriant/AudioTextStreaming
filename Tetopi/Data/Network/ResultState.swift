//
//  ResultState.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 10/08/21.
//

import Foundation

enum ResultState<T>{
    case loading
    case success(content: T)
    case failed(error: Error)
}
