//
//  ArticleListService.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 09/08/21.
//

import Foundation

var TOKEN_BEARER = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hcGlnZW4ua29tcGFzLmlkIiwiaWF0IjoxNjI5MjA5MzQ3LCJleHAiOjE2MjkyMTAyNDcsImRhdGEiOnsiaWQiOiI0N2ExNzUwOC00OWE3LTRiNjUtYjM0Mi0zNDEwZTVmMzRhODciLCJlbWFpbCI6InJlaW5hbGRvLnJpYW50QGtvbXBhcy5jb20iLCJzY29wZSI6WyJyZWFkLWFydGljbGUiLCJyZWFkLXByb2ZpbGUiXX19.MUBvvNoJzsbKbzOvgQ3zzbs_ZIrj9JZTj8z8eEflJoy5SDuGz46r1RN8S2EX42tBnx8vYN0Ytrdnw5Y8INu1H02y5rw8qUoYpm4ippLiRnzErzdJP-3Zr9SVxocHSJBfCwsGIsesLU7P8rEBrkkyfEd_xEYsGX_ate31R6_gc8E"
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
            return URL(string: "https://apikid.kompas.id/")!
        }
    }
    
    var path: String {
        switch self {
        case .getTerbaruListNoCursor :
            return "v2/article/list/terms"
        }
    }
}
