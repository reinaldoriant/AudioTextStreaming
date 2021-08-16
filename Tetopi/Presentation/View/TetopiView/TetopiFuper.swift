//
//  ContentView.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 07/08/21.
//

import SwiftUI
import URLImage

struct TetopiFuper: View {
    @StateObject var data: TetopiViewModel
    //MARK: - Properties
    @State var isPlaying : Bool = false
    @State private var celsius: CGFloat = 0
    @State var width : CGFloat = UIScreen.main.bounds.height < 750 ? 130 : 230
    // MARK: - Body
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
            topSection
            Spacer()
            middleSection
            playerSection
            Spacer()
            bottomSection
        }
        
        
        .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
        
        
    }
    
    //MARK: - Top Section
    var topSection: some View {
        ZStack{
            VStack{
                HStack{
                    Image("imgButtonBlueArrow")
                    Spacer()
                }.padding(.bottom,32)
            }
            HStack(spacing:4){
                VStack{
                    Text("Mendengarkan audio artikel dari")
                        .hindRegular14()
                        .foregroundColor(Color(UIColor(named: "ColorBlack333")!))
                    Text("Terbaru")
                        .hindSemiBold16()
                        .textCase(.uppercase)
                        .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
                }
            }
        }
    }
    
    //MARK: - Middle Section
    var middleSection: some View {
        VStack(spacing:16){
            if let imgurl = data.dataTetopi?.image,
               let url = URL(string: imgurl){
                URLImage(url: url,
                         failure:{ error, _ in
                            EmptyView()
                         }, content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 183,alignment: .center)
                                .clipped()
                                .padding(.bottom,16)
                         })
            }
            VStack {
                Text(data.dataTetopi?.title ?? "")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                    .lineLimit(3)
                    .frame(width: 328, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                let _ = print(data.dataTetopi?.title ?? "kosong")
                let _ = print(data, "Kamu apa")
            }
            Text(getDateWithCategory(date: data.dataTetopi?.time ?? "", category: data.dataTetopi?.category ?? ""))
                .hindMedium14()
                .foregroundColor(Color(UIColor(named: "ColorGray666")!))
        } .padding(.init(top: 0, leading: 0, bottom: 83, trailing: 0))
    }
    
    //MARK: - Player Section
    var playerSection: some View {
        
        VStack{
            //Slider
            ZStack {
//                Capsule()
//                    .fill(Color(UIColor(named: "ColorGrayDDD")!))
//                    .frame(height: 8)
//                    .shadow(color: Color(UIColor(named: "ColorGrayDDD")!), radius: 1)
//                Capsule()
//                    .fill(Color(UIColor(named: "ColorBlueKompas")!))
//                    .frame(width: 2, height: 8)
                
            }.padding(.bottom, 40)
            
            HStack(alignment:.center, spacing:0) {
                //Previous Audio
                Button(action:{},label: {
                    Image("imgButtonSkipPrevious").resizable()
                })
                .frame(width: 40, height: 40, alignment: .center)
                
                //Replay Audio
                Button(action:{},label: {
                    Image("imgButtonReplay").resizable()
                })
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.leading,32)
                
                //Play Pause Audio
                Button(action: {}, label: {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                })
                .frame(width: 44, height: 44, alignment: .center)
                .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
                .padding(.init(top: 0, leading: 36, bottom: 0, trailing: 36))
                
                //Forward Audio
                Button(action: {}, label: {
                    Image("imgButtonForward").resizable()
                })
                .frame(width: 40, height: 40, alignment: .center)
                .padding(.trailing,32)
                
                //Next Audio
                Button(action:{},label: {
                    Image("imgButtonSkipNext").resizable()
                })
                .frame(width: 40, height: 40, alignment: .center)
            }.padding(.bottom,16)
        }
    }
    
    //MARK: - Bottom Section
    var bottomSection: some View{
        HStack(alignment:.center,spacing:0){
            Button(action: {},label:{
                Text("1x")
                    .hindSemiBold16()
                    .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                
            })
         
            Spacer()
            Button(action: {},label:{
                Text("Baca artikel ini")
                    .underline()
                    .hindRegular16()
                    .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
            })
            .padding(.trailing,16)
            .padding(.leading,32)
            Spacer()
            Button(action: {},label:{
                Image("imgButtonPlaylist")
            })
        }
    }
}

// MARK: - Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        TetopiFuper(data: TetopiModel(name: "Polisi Tahan pelaku Penyelewengan Bansos Puluhan Warga di Malang", image: "https://d2huqozv2aqnkj.cloudfront.net/wp-content/uploads//2021/08/20210807_140016_1628334613-150x150.jpg", title: "Polisi Tahan pelaku Penyelewengan Bansos Puluhan Warga di Malang", time: "2021-08-11 15:28:03", category: "Nusantara", audio: "https://apio.kompas.id/soundwave/?blogtype=editorial&berkas=dinkes-banten-tambah-vaksinator-dan-penyuluh-vaksinasi-covid-19.mp3"))
//    }
//}
