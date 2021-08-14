//
//  ArticleListTerbaru.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 10/08/21.
//

import SwiftUI

struct ArticleListTerbaru: View {
    @ObservedObject var viewModel = ArticleListTerbaruViewModel(repo: ArticleListService())
    @StateObject var appModel = TetopiViewModel()
    
    var body: some View {
        Group{
            switch viewModel._articleListTerbaruState {
            case .success(let content):
                ScrollView{
                    LazyVStack{
                        ForEach(content, id:\.name){ article in
                            CardthumbItemView(article: article)
                            Rectangle()
                                .frame(height: 6)
                                .foregroundColor(Color(UIColor(named: "ColorGrayEEE")!))
                        }
                    }
                }
            case .failed(error: let error):
                Text("Kenapa ini 🥲 \(error.localizedDescription)")
            case .loading:
                ProgressView()
                    .padding(.leading,16)
            }
//            if appModel.showPlayer {
//                TetopiFuper(data: appModel)
//            }
        }.onAppear{
            viewModel.getArticleListTerbaruNoCursor()
        }
        
    }
}

struct ArticleListTerbaru_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListTerbaru()
    }
}
