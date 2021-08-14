//
//  Headline.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Headline : Codable {

        let metaKey : String?
        let metaValue : String?

        enum CodingKeys: String, CodingKey {
                case metaKey = "meta_key"
                case metaValue = "meta_value"
        }
}
