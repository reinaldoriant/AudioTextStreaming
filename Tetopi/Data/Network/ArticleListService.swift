//
//  ArticleListService.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 10/08/21.
//

import Foundation
import Combine

//MARK: - Service
struct ArticleListService: ArticleListRepository {
    
    //MARK: - Get Hot Topics
    func getTerbaruListNoCursor(from endpoint: ArticleListAPI) -> AnyPublisher<ArticleListModel, ErrorResponse>{
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in ErrorResponse.unknown}
            .flatMap{ data, response -> AnyPublisher<ArticleListModel,ErrorResponse> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: ErrorResponse.unknown).eraseToAnyPublisher()
                }
                if(200...299).contains(response.statusCode){
                    return Just(data)
                        .decode(type: ArticleListModel.self , decoder: JSONDecoder())
                        .mapError{ error in
                            return ErrorResponse.decodingError
                        }
                        .eraseToAnyPublisher()
                }
                else{
                    return Fail(error: ErrorResponse.errorCode(response.statusCode)).eraseToAnyPublisher()
                }

            }
            .eraseToAnyPublisher()
    }
}
