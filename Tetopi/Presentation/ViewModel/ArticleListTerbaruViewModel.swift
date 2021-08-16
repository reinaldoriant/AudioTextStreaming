//
//  TetopiViewModel.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 09/08/21.
//

import Foundation
import Combine

class ArticleListTerbaruViewModel:ObservableObject{
    
    @Published private(set) var _articleListTerbaruState: ResultState<[Article]> = .loading
    
    private(set) var _articleTerbaruList = [Article]()
    private let _articleListRepo: ArticleListRepository
    
    private var _cancellables = Set<AnyCancellable>()
    
    init(repo: ArticleListRepository ) {
        self._articleListRepo = repo
    }
    
    func getArticleListTerbaruNoCursor() {
        //self._articleListTerbaruState = .loading
        let date = Date().getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")
        let cancellable = _articleListRepo
            .getTerbaruListNoCursor(from: .getTerbaruListNoCursor(siteId: "1", timeStamp: date))
            .sink(receiveCompletion:{res in
                switch res{
                case .finished:
                    self._articleListTerbaruState = .success(content: self._articleTerbaruList)
                case .failure(let error):
                    self._articleListTerbaruState = .failed(error: error)
                }
            },receiveValue: { response in
                self._articleTerbaruList = (response.result?.articles)!
               
            })
        self._cancellables.insert(cancellable)
    }
}
