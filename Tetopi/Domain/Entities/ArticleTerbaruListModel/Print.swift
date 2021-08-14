//
//  Print.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Print : Codable {

        let edition : Edition?
        let headline : Headline?
        let page : Page?

        enum CodingKeys: String, CodingKey {
                case edition = "edition"
                case headline = "headline"
                case page = "page"
        }
}
