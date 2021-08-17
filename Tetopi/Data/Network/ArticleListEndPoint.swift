//
//  ArticleListService.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 09/08/21.
//

import Foundation

var TOKEN_BEARER = "YOUR TOKEN"
//MARK: - Enum Search API
enum ArticleListAPI {
    case getTerbaruListNoCursor (siteId : String, timeStamp : String)
}

extension ArticleListAPI: APIBuilder {
    var urlRequest: URLRequest {
        switch self{
        case.getTerbaruListNoCursor (let siteId, let timeStamp) :
            var terbaruListNoCursor = URLComponents(string: self.baseUrl.appendingPathComponent(self.path).absoluteString)
            let siteIdURL =  URLQueryItem(name: "siteid", value: siteId )
            let timestampURL =  URLQueryItem(name: "timestamp", value: timeStamp)
            terbaruListNoCursor?.queryItems = [siteIdURL,timestampURL]
            var terbaruListNoCursorFinal = URLRequest(url: (terbaruListNoCursor?.url)!)
            terbaruListNoCursorFinal.addValue("Bearer \(TOKEN_BEARER)", forHTTPHeaderField: "Authorization")
            return terbaruListNoCursorFinal
            
        }
        
    }
    
    var baseUrl: URL {
        switch self {
        case .getTerbaruListNoCursor :
            return URL(string: "YOUR BASE URL")!
        }
    }
    
    var path: String {
        switch self {
        case .getTerbaruListNoCursor :
            return "YOUR PATH"
        }
    }
}
