//
//  Size.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Size : Codable {

        let large : Large?
        let medium : Medium?
        let mediumLarge : MediumLarge?
        let original : Original?
        let postThumbnail : PostThumbnail?
        let thumbnail : Thumbnail?
        let thumbnailMedium : ThumbnailMedium?

        enum CodingKeys: String, CodingKey {
                case large = "large"
                case medium = "medium"
                case mediumLarge = "medium_large"
                case original = "original"
                case postThumbnail = "post-thumbnail"
                case thumbnail = "thumbnail"
                case thumbnailMedium = "thumbnail_medium"
        }
    
    var availableSizes : String? {
        return (medium != nil) ? medium?.permalink : (large != nil) ? large?.permalink : (mediumLarge != nil) ? mediumLarge?.permalink : original?.permalink
    }

}
