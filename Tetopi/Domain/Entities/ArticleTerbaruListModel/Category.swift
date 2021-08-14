//
//  Category.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Category : Codable {

        let name : String?
        let slug : String?

        enum CodingKeys: String, CodingKey {
                case name = "name"
                case slug = "slug"
        }

}
