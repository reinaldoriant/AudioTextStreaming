//
//  Original.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Original : Codable {

        let mimeType : String?
        let permalink : String?

        enum CodingKeys: String, CodingKey {
                case mimeType = "mime-type"
                case permalink = "permalink"
        }
}
