//
//  Meta.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Meta : Codable {

        let cache : Bool?
        let id : Int?
        let pin : Bool?
        let print : Print?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case cache = "cache"
                case id = "id"
                case pin = "pin"
                case print = "print"
                case type = "type"
        }
}
