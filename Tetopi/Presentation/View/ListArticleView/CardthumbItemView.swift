//
//  CardthumbItemView.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 10/08/21.
//

import SwiftUI
import URLImage

struct CardthumbItemView: View {
    @State var article: Article
    @StateObject var tetopiViewModel = TetopiViewModel()
    @ObservedObject var viewModel = ArticleListTerbaruViewModel(repo: ArticleListService())
    
    var body: some View {
        VStack(alignment:.center,spacing: 0){
            //MARK: - Top
            ZStack (alignment: .topLeading){
                if let imgurl = article.thumbnails?.availableSizes,
                   let url = URL(string: imgurl){
                    URLImage(url: url,
                             failure:{ error, _ in
                                EmptyView()
                             }, content: { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 202, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .clipped()
                             })
                }
                VStack {
                    if(article.isFreemium!){
                        Text("Bebas Akses")
                            .labelStyle()
                            .padding(.horizontal,8)
                            .background(Color(UIColor(named: "ColorBlueLabel")!))
                            .cornerRadius(4)
                    }
                }.padding(.init(top: 8, leading: 8, bottom: 0, trailing: 0))
            }
            
            //MARK: - Center
            VStack(alignment:.leading,spacing:12) {
                Text(article.title!)
                    .playfairBold20Black().foregroundColor(Color(UIColor(named: "ColorBlack333")!))
                Text(article.excerpt!).hindRegular16().foregroundColor(Color(UIColor(named: "ColorGray666")!))
            }.padding(.init(top: 12, leading: 16, bottom: 0, trailing: 16))
            //MARK: - Bottom
            HStack(alignment: .firstTextBaseline){
                Text(getDateArticleList(date: article.publishedDate!, category: (article.terms?.category![0].name)!))
                    .hindRegular12()
                    .foregroundColor(Color(UIColor(named: "ColorGray999")!))
                Spacer()
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("imgButtonShare")
                        
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "bookmark")
                            .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                    })
                   
                      
                    Button(action:{
                        DispatchQueue.main.async {
                            tetopiViewModel.insertDataTetopi(data: TetopiModel(name: (article.name)!, image: (article.thumbnails?.availableSizes)!, title: (article.title)!, time: (article.publishedDate)!, category: (article.terms?.category![0].name)!, audio: (article.audio)!))
                        }
                    }, label: {
                        Image("imgButtonTetopi")
                            
                    })
                }
                .padding(.init(top: 10, leading: 16, bottom: 10, trailing: 16))
            }.padding(.horizontal,16)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
//struct CardthumbItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardthumbItemView(Article)
//    }
//}
