//
//  DashboardView.swift
//  Tetopi
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct DashboardView: View {
    
    //MARK: - Tetopi Properties
//    @State var expandFuper = false
//    @State var heightPhone = 0
    @StateObject var tetopiViewModel = TetopiViewModel()
    @ObservedObject var terbaruViewModel = ArticleListTerbaruViewModel(repo: ArticleListService())
    
    var body: some View {
        GeometryReader{geometry in
            let _ = print(String(tetopiViewModel.showPlayer))
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                
                //MARK: - TabBar
                
                TabBarView()
                
                //MARK: - Tetopi
                let _ = print(tetopiViewModel.showPlayer)
                if tetopiViewModel.showPlayer{
                    TetopiView(expandFuper: tetopiViewModel.expandFuper ,heightPhone: tetopiViewModel.heightPhone )
                }
            }
            .onAppear{
                if geometry.size.height > 647 {
                    tetopiViewModel.heightPhone = -29
                }
                else{
                    tetopiViewModel.heightPhone = -59
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
        DashboardView()
    }
}
