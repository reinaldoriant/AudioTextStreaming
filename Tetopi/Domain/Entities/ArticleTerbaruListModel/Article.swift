//
//  Article.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Article : Codable {

        let articleByLine : ArticleByLine?
        let audio : String?
        let editors : [String]?
        let excerpt : String?
        let imageCounter : Int?
        let isFreemium : Bool?
        let isBookmark : Bool?
        let keyword : Keyword?
        let meta : Meta?
        let name : String?
        let permalink : String?
        let publishedDate : String?
        let publishedDateGmt : String?
        let status : String?
        let terms : Term?
        let thumbnails : Size?
        let title : String?

        enum CodingKeys: String, CodingKey {
                case articleByLine = "article_by_line"
                case audio = "audio"
                case editors = "editors"
                case excerpt = "excerpt"
                case imageCounter = "image_counter"
                case isFreemium = "is_freemium"
                case isBookmark = "isBookmark"
                case keyword = "keyword"
                case meta = "meta"
                case name = "name"
                case permalink = "permalink"
                case publishedDate = "published_date"
                case publishedDateGmt = "published_date_gmt"
                case status = "status"
                case terms = "terms"
                case thumbnails = "thumbnails"
                case title = "title"
        }
}
