//
//  Term.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on August 11, 2021

import Foundation

struct Term : Codable {

        let category : [Category]?
        let followingUsers : [FollowingUser]?
        let postTag : [PostTag]?

        enum CodingKeys: String, CodingKey {
                case category = "category"
                case followingUsers = "following_users"
                case postTag = "post_tag"
        }
}
