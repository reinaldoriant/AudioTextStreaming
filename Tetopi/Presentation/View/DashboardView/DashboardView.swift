//
//  DashboardView.swift
//  Tetopi
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct DashboardView: View {
    
    //MARK: - Tetopi Properties
    @State var expandFuper = false
    @Namespace var animationTransition
    @State var heightPhone = 0
    @StateObject var tetopiViewModel = TetopiViewModel()
    
    var body: some View {
        GeometryReader{geometry in
            let _ = print(String(tetopiViewModel.showPlayer))
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                
                
                //MARK: - TabBar
                
                TabBarView()
                
                //MARK: - Tetopi
                let _ = print(tetopiViewModel.showPlayer)
                if tetopiViewModel.showPlayer{
                    TetopiView(animationTransition: animationTransition, expandFuper:$expandFuper,heightPhone: $heightPhone )
                }
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
