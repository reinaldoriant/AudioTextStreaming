//
//  ArticleListModel.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct ArticleListModel : Codable {

        let code : Int?
        let message : Message?
        let result : Result?
        let status : String?

        enum CodingKeys: String, CodingKey {
                case code = "code"
                case message = "message"
                case result = "result"
                case status = "status"
        }

}
