//
//  DashboardView.swift
//  Tetopi
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct DashboardView: View {
    //MARK: - Dashboard Properties
    @State var selectedIndex = 0
    @State var current = 0
    @State var heightPhone = 0
    //MARK: - Tetopi Properties
    @State var expandFuper = false
    @Namespace var animationTransition 
    
    let tabBarImageNames = ["imgButtonMainMenu", "imgButtonEpaper", "imgButtonBook", "imgButtonProfile"]
    let tabBarTextNames = ["Kompas.id", "ePaper","Buku","Akun"]
    
    
    
    var body: some View {
        GeometryReader{geometry in
//            Text("heightPhone = \(heightPhone) dan \(geometry.size.height)")
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
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
                }.ignoresSafeArea()
                //            TabView(selection: $current,
                //                    content:  {
                //                        ArticleListTerbaru().tabItem { Image(tabBarImageNames[0])
                //                            Text(tabBarTextNames[0]) }.tag(0)
                //                        ePaperView().tabItem { Image(tabBarImageNames[1])
                //                            Text(tabBarTextNames[1]) }.tag(1)
                //                        bookView().tabItem { Image(tabBarImageNames[2])
                //                            Text(tabBarTextNames[2]) }.tag(2)
                //                        akunView().tabItem { Image(tabBarImageNames[3])
                //                            Text(tabBarTextNames[3]) }.tag(3)
                //                    }
                //            )
                //            .onAppear() {
                //                        UITabBar.appearance().backgroundColor = .red
                //                    }
                //            .accentColor(Color(red: 0, green: 0.349, blue: 0.604) )
                
                
                //            .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.2), radius: 4, x: 0, y: 0)
                
                //MARK: - Tetopi
                
                TetopiView(animationTransition: animationTransition, expandFuper:$expandFuper,heightPhone: $heightPhone )
            }
            .onAppear{
                if geometry.size.height > 647 {
                    heightPhone = -29
                }
                else{
                    heightPhone = -69
                }
            }
            
        }
        
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
