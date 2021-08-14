//
//  Large.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Large : Codable {

        let height : Int?
        let mimeType : String?
        let permalink : String?
        let width : Int?

        enum CodingKeys: String, CodingKey {
                case height = "height"
                case mimeType = "mime-type"
                case permalink = "permalink"
                case width = "width"
        }
 }

