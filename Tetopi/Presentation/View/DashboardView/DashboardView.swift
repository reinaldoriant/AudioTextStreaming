//
//  DashboardView.swift
//  Tetopi
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct DashboardView: View {
    //MARK: - Properties
    @State var selectedIndex = 0
    
    let tabBarImageNames = ["imgButtonMainMenu", "imgButtonEpaper", "imgButtonBook", "imgButtonProfile"]
    let tabBarTextNames = ["Kompas.id", "ePaper","Buku","Akun"]
    
    var body: some View {
        VStack{
            //MARK: - View
            Spacer()
            ZStack{
                switch selectedIndex{
                case 0:
                    ArticleListTerbaru()
                case 1:
                    ePaperView()
                case 2:
                    bookView()
                default:
                    akunView()
                }
                
            }
            Spacer()
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                //MARK: - Tab Bar
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 68, alignment: .bottom)
                        .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.2), radius: 4, x: 0, y: 0)
                                .mask(Rectangle().padding(.top, -20))
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
                }
                                TetopiComper()
                                    
            }
        }.ignoresSafeArea(.all, edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
