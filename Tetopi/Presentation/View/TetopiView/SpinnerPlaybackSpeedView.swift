//
//  SpinnerPlaybackSpeedView.swift
//  Tetopi
//
//  Created by TI Digital on 17/08/21.
//

import SwiftUI

struct SpinnerPlaybackSpeedView: View {
    @EnvironmentObject var tetopiViewModel: TetopiViewModel
    
    let speedRate = [
        SpeedRateData(name: "0.25x", value: 0.25),
        SpeedRateData(name: "0.5x", value: 0.5),
        SpeedRateData(name: "0.75x", value: 0.75),
        SpeedRateData(name: "1x", value: 1.00),
        SpeedRateData(name: "1.25x", value: 1.25),
        SpeedRateData(name: "1.5x", value: 1.5),
        SpeedRateData(name: "1.75x", value: 1.75),
        SpeedRateData(name: "2x", value: 2.00)
    ]
    
    var body: some View {
        VStack(spacing:28){
            ForEach(0..<speedRate.count){ value in
                
                Button(action: {
                    tetopiViewModel.rateSpeedAudio(name: speedRate[value].name, speed: speedRate[value].value)
                }, label: {
                    Text(speedRate[value].name)
                        .hindSemiBold16()
                        .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                })
            }
        }
        .padding(.vertical,16)
        .padding(.horizontal,10)
        .background(Color.white)
        .border(Color(UIColor(named: "ColorGrayDDD")!).opacity(0.25))
        
    }
}

struct SpeedRateData {
    var name: String
    var value: Float
}

struct SpinnerPlaybackSpeedView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerPlaybackSpeedView().previewLayout(.sizeThatFits)
    }
}
