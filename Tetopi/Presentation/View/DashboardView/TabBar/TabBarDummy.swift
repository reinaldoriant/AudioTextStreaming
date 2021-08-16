//
//  MainView(.swift
//  Tetopi
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct TabBarDummy: View {
    
    @State var current = 0
    let tabBarImageNames = ["imgButtonMainMenu", "imgButtonEpaper", "imgButtonBook", "imgButtonProfile"]
    let tabBarTextNames = ["Kompas.id", "ePaper","Buku","Akun"]
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color.white) // custom color.
       }
    var body: some View {
        //            Text("heightPhone = \(heightPhone) dan \(geometry.size.height)")
        TabView(selection: $current){
            ArticleListTerbaru().tabItem { Image(tabBarImageNames[0])
                Text(tabBarTextNames[0]) }.tag(0)
            ePaperView().tabItem { Image(tabBarImageNames[1])
                Text(tabBarTextNames[1]) }.tag(1)
            bookView().tabItem { Image(tabBarImageNames[2])
                Text(tabBarTextNames[2]) }.tag(2)
            akunView().tabItem { Image(tabBarImageNames[3])
                Text(tabBarTextNames[3]) }.tag(3)
        }
        .accentColor(Color(red: 0, green: 0.349, blue: 0.604) )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarDummy()
    }
}
