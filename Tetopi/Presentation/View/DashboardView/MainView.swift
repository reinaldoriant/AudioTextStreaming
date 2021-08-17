//
//  DashboardView.swift
//  Tetopi
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - Tetopi Properties
//    @State var expandFuper = false
//    @State var heightPhone = 0
    @StateObject var tetopiViewModel = TetopiViewModel()
    @ObservedObject var terbaruViewModel = ArticleListTerbaruViewModel(repo: ArticleListService())
    
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                
                //MARK: - TabBar
                
                TabBarView()
                
                
            }
            .onAppear{
                if geometry.size.height > 647 {
                    tetopiViewModel.heightPhoneType = "TypeX"
                }
                else{
                    tetopiViewModel.heightPhoneType = "NotTypeX"
                }
                
                terbaruViewModel.getArticleListTerbaruNoCursor()
            }
            .environmentObject(tetopiViewModel)
            .environmentObject(terbaruViewModel)
            
        }
        
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
