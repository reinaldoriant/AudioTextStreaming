//
//  SpinnerPlaybackSpeedView.swift
//  Tetopi
//
//  Created by TI Digital on 17/08/21.
//

import SwiftUI

struct SpinnerPlaybackSpeedView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 56, height: 436)
                .foregroundColor(Color.white)
                .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.2), radius: 4, x: 0, y: 0)
            
            VStack(spacing: 28){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("0.25x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
                Button(action: {}, label: {
                    Text("0.5x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("0.75x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("1x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("1.25x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("1.5x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("1.75x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("2x")
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
            }
        }
    }
}

struct SpinnerPlaybackSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerPlaybackSpeedView().previewLayout(.sizeThatFits)
    }
}
