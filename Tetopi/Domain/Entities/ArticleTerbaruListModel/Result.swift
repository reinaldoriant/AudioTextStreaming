//
//  Result.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Result : Codable {

        let articles : [Article]?
        let meta : Meta?

        enum CodingKeys: String, CodingKey {
                case articles = "articles"
                case meta = "meta"
        }
}
