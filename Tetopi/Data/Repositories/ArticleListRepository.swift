//
//  ArticleListRepository.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 10/08/21.
//

import Foundation
import Combine

protocol ArticleListRepository {
    func getTerbaruListNoCursor(from endpoint: ArticleListAPI) -> AnyPublisher<ArticleListModel, ErrorResponse>
}
