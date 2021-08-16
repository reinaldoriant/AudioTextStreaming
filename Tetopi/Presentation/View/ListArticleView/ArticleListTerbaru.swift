//
//  ArticleListTerbaru.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 10/08/21.
//

import SwiftUI

struct ArticleListTerbaru: View {
    @ObservedObject var viewModel = ArticleListTerbaruViewModel(repo: ArticleListService())
    
    
    var body: some View {
        VStack{
            switch viewModel._articleListTerbaruState {
            case .success(let content):
                ScrollView{
                    LazyVStack{
                        ForEach(content, id:\.name){ article in
                            CardthumbItemView(article: article)
                                
                        }
                    }
                }
            case .failed(error: let error):
                Text("Kenapa ini 🥲 \(error.localizedDescription)")
            case .loading:
                ProgressView()
                    .padding(.leading,16)
            }
        }
        .onAppear{
            viewModel.getArticleListTerbaruNoCursor()
            
        }
    }
    
    
    struct ArticleListTerbaru_Previews: PreviewProvider {
        static var previews: some View {
            ArticleListTerbaru()
        }
    }
}
