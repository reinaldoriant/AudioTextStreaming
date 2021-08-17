//
//  TabBarViewItem.swift
//  Tetopi
//
//  Created by TI Digital on 15/08/21.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var tetopiViewModel: TetopiViewModel
    //MARK: - Dashboard Properties
    @State var selectedIndex = 0
    @State var current = 0
    
    let tabBarImageNames = ["imgButtonMainMenu", "imgButtonEpaper", "imgButtonBook", "imgButtonProfile"]
    let tabBarTextNames = ["Kompas.id", "ePaper","Buku","Akun"]
    
    var body: some View {
        ZStack(alignment: .bottom){
            //MARK: - Main View
            VStack{
                switch selectedIndex{
                case 0:
                    ArticleListTerbaru()
                //.environmentObject(tetopiViewModel)
                case 1:
                    ePaperView()
                case 2:
                    bookView()
                default:
                    akunView()
                }
            }
            //MARK: - Tetopi
            if tetopiViewModel.showPlayer{
                TetopiView()
            }
            
            //MARK: - Dashboard View
            VStack{
                Spacer()
                HStack{
                    ForEach(0..<4) {num in
                        Button(action: {
                            selectedIndex = num
                        }, label: {
                            Spacer()
                            VStack {
                                Image(tabBarImageNames[num])
                                    .foregroundColor(selectedIndex == num ? Color(red: 0, green: 0.349, blue: 0.604) : Color(red: 0.4, green: 0.4, blue: 0.4))
                                Text(tabBarTextNames[num])
                                    .font(.system(size:9))
                                    .foregroundColor(selectedIndex == num ? Color(red: 0, green: 0.349, blue: 0.604) : Color(red: 0.4, green: 0.4, blue: 0.4))
                            }.frame(height: 35)
                            Spacer()
                        })
                    }
                }
                .padding(.top,9)
                .padding(.bottom,16)
                .background(Color.white)
                .clipped()
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.2), radius: 4, x: 0, y: 0)
            }.opacity(tetopiViewModel.expandFuper ? 0 : 1)
            //MARK: - Tetopi
        }.ignoresSafeArea()
    }
}

struct TabBarViewItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
