//
//  TetopiComper.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct TetopiComper: View {
    var body: some View{
        ZStack {
            Rectangle()
                .fill(Color.white)
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.2), radius: 1, x: 0, y: 0)
                .mask(Rectangle().padding(.top, -20))
                .frame(height: 80)
                .offset(y:-69)
            HStack{
                Image("imgMockTetopi")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
                VStack(alignment: .leading, spacing: 2){
                    Spacer()
                    Text("PM Rajoy beri waktu aku riset tetopi")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("PlayFairDisplay-Bold", size: 16))
                        .lineLimit(1)
                    
                    
                    Text(getDateArticleList(date: "2021-08-14 15:00:00", category: "International"))
                        .hindRegular12()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                    
                    Spacer()
                }
                .frame(width: 168)
                .padding(.trailing,22)
                Spacer()
                HStack(spacing: 22) {
                    Button(action: {}, label: {
                        Image(systemName: "pause.fill").resizable()
                    })
                    .frame(width: 14, height: 14, alignment: .center)
                    .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
                    
                    Rectangle()
                        .frame(width: 1, height: 50)
                        .foregroundColor(Color(UIColor(named: "ColorGrayDDD")!))
                    Button(action: {}, label: {
                        Image(systemName: "xmark").resizable()
                            .frame(width: 14, height: 14, alignment: .center)
                            .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                    })
                    .padding(.trailing,22)
                }
            }
            .frame(height: 80)
            .offset(y:-69)
        }
      
    }
}
struct TetopiComper_Previews: PreviewProvider {
    static var previews: some View {
        TetopiComper()
        
    }
}
