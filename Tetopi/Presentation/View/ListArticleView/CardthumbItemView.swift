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
    @EnvironmentObject var tetopiViewModel: TetopiViewModel
    
    
    var body: some View {
        
        VStack(alignment:.center,spacing: 0){
            //MARK: - Top
            Rectangle()
                .frame(height: 6)
                .foregroundColor(Color(UIColor(named: "ColorGrayEEE")!))
            VStack{
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
                                        .frame(width: .infinity,height: 202, alignment: .center)
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
                
                
            }
            
            //MARK: - Center
            VStack(spacing:0) {
                Text(article.title!)
                    .playfairBold20Black().foregroundColor(Color(UIColor(named: "ColorBlack333")!))
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(article.excerpt!).hindRegular16()
                    .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                    .frame(maxWidth: .infinity,maxHeight: 120, alignment: .leading)
            }
            
            .padding(.top, 12)
            .padding(.horizontal,16)
            VStack {
                
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
                        Button(action: {tetopiViewModel.showPlayer = true}, label: {
                            Image(systemName: "bookmark")
                                .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                        })
                        Button(action:{
                            DispatchQueue.main.async {
                                tetopiViewModel.insertDataTetopi(data: TetopiModel(name: (article.name)!, image: (article.thumbnails?.availableSizes)!, title: (article.title)!, time: (article.publishedDate)!, category: (article.terms?.category![0].name)!, audio: (article.audio)!))
                                tetopiViewModel.showPlayer = true
                            }
                        }, label: {
                            Image("imgButtonTetopi")
                            
                        })
                    }
                    .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                }
                
            }
            .padding(.horizontal,16)
        }.edgesIgnoringSafeArea(.all)
    }
    
}


