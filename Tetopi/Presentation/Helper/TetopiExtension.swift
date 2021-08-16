//
//  TetopiExtension.swift
//  Tetopi
//
//  Created by TI Digital on 16/08/21.
//

import Foundation

extension String {
    func checkCategoryTetopi() -> Bool {
        switch self {
        case "video" : return false
        case "galeri-foto" : return false
        case "foto-cerita" : return false
        case "klinik-foto-kompas" : return false
        case "statis" : return false
        case "videografik" : return false
        case "interaktif" : return false
        case "Premium" : return false
        case "promo-halaman-utama" : return false
        default: return true
        }
    }
}
