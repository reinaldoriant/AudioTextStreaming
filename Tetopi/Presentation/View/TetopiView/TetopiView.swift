//
//  TetopiComper.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI
import URLImage

struct TetopiView: View {
    //MARK: - Properties
    
    @EnvironmentObject var tetopiViewModel: TetopiViewModel
    var height = UIScreen.main.bounds.height / 3
    
    var body: some View{
        Group{
            //MARK: - Tetopi Fuper
            if tetopiViewModel.expandFuper{
                ZStack() {
                    VStack(alignment: .center){
                        
                        //MARK: - Category and button down
                        ZStack{
                            VStack{
                                HStack{
                                    Button(action: {
                                            tetopiViewModel.expandFuper = false}, label: {
                                                Image("imgButtonBlueArrow")
                                            })
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
                        
                        Spacer()
                        //MARK: - Image and title with date fuper
                        VStack(spacing:16){
                            if let imgurl = tetopiViewModel.dataTetopi?.image ?? "Gambar kosong",
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
                                Text(tetopiViewModel.titleToString)
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                                    .lineLimit(3)
                                    .frame(width: 328, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                            Text(getDateWithCategory(date: tetopiViewModel.dataTetopi?.time ?? "time kosong", category: tetopiViewModel.categoryToString))
                                .hindMedium14()
                                .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                        }.padding(.bottom, 83)
                        
                        //MARK: - Player Audio fuper
                        VStack{
                            //Slider Audio
                            //                        CustomSlider(value: $tetopiViewModel.valueSlider, range: 0...tetopiViewModel.valueDurationSlider)
                            Slider(value: $tetopiViewModel.valueCurrentSlider, in: 0...tetopiViewModel.valueDurationSlider)
                                .accentColor(Color(UIColor(named: "ColorBlueKompas")!))
                            HStack(){
                                Text(getTimeTetopi(time: tetopiViewModel.elapsedTime))
                                    .hindRegular12()
                                    .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                                Spacer()
                                Text(getTimeTetopi(time:tetopiViewModel.durationTime)
                                ).hindRegular12()
                                .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                            }
                            
                            HStack(alignment:.center, spacing:0) {
                                //Previous Audio
                                Button(action:{},label: {
                                    Image("imgButtonSkipPrevious").resizable()
                                })
                                .frame(width: 40, height: 40, alignment: .center)
                                
                                //Replay Audio
                                Button(action:{tetopiViewModel.skipBackward15()},label: {
                                    Image("imgButtonReplay").resizable()
                                })
                                .frame(width: 40, height: 40, alignment: .center)
                                .padding(.leading,32)
                                
                                //Play Pause Audio
                                Button(action: {tetopiViewModel.playPauseAudio()}, label: {
                                    Image(systemName: tetopiViewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill").resizable()
                                })
                                .frame(width: 44, height: 44, alignment: .center)
                                .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
                                .padding(.init(top: 0, leading: 36, bottom: 0, trailing: 36))
                                
                                //Forward Audio
                                Button(action: {tetopiViewModel.skipForward15()}, label: {
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
                        
                        Spacer()
                        
                        //MARK: - Baca Artikel, List and speed audio fuper
                        HStack(alignment:.center,spacing:0){
                            Button(action: {
                                withAnimation{
                                    tetopiViewModel.showSpinnerPlayback = true
                                }
                            },label:{
                                Text(tetopiViewModel.isSpinnerChanged ? tetopiViewModel.speedRateName : "1x")
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
                    .padding(.init(top: tetopiViewModel.heightTopFuper, leading: 16, bottom: 16, trailing: 16))
                    
                    //MARK: - Spinner Speed Rate
                    VStack(alignment: .leading){
                        Spacer()
                        if tetopiViewModel.showSpinnerPlayback{
                            HStack{
                                SpinnerPlaybackSpeedView()
                                    .padding(.bottom, 16)
                                    .padding(.leading,16)
                                Spacer()
                            }
                        }
                    }
                }
                .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
            }
            //MARK: - Tetopi Comper
            else {
                VStack(spacing: 0){
                    ZStack(alignment: .leading) {
                        Rectangle().fill(Color.white.opacity(0.08)).frame(height: 4)
                        Rectangle().fill(Color(UIColor(named: "ColorBlueKompas")!)).frame(width: tetopiViewModel.valueCurrentSliderComper, height: 4)
                    }
                    
                    HStack{
                        //MARK: - Image Tetopi Comper
                        ZStack(alignment: .topLeading){
                            
                            if let imgurl = tetopiViewModel.dataTetopi?.image ?? "Gambarnya Kosong",
                               let url = URL(string: imgurl){
                                URLImage(url: url,
                                         failure:{ error, _ in
                                            EmptyView()
                                         }, content: { image in
                                            image
                                                .resizable()
                                                .interpolation(.none)
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipped()
                                         })
                            }
                            VStack(alignment: .leading){
                               
                                    
                                Image("imgIndicatorExpandFuper")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                            }
                        }
                        
                        //MARK: - Title and date Tetopi Comper
                        VStack(alignment: .leading, spacing: 2){
                            Spacer()
                            Text(tetopiViewModel.titleToString)
                                .multilineTextAlignment(.center)
                                .font(Font.custom("PlayFairDisplay-Bold", size: 16))
                                .lineLimit(1)
                            
                            
                            Text(getDateArticleList(date: tetopiViewModel.dataTetopi?.time ?? "Tanggal kosong", category: tetopiViewModel.categoryToString))
                                .hindRegular12()
                                .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                            
                            Spacer()
                        }
                        .frame(width: 168)
                        .padding(.trailing,22)
                        Spacer()
                        
                        //MARK: - Player and close Tetopi Comper
                        HStack(spacing: 22) {
                            Button(action: {
                                tetopiViewModel.playPauseAudio()
                            }, label: {
                                Image(systemName: tetopiViewModel.isPlaying ? "pause.fill" : "play.fill").resizable()
                            })
                            .frame(width: 14, height: 14, alignment: .center)
                            .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
                            
                            Rectangle()
                                .frame(width: 1, height: 50)
                                .foregroundColor(Color(UIColor(named: "ColorGrayDDD")!))
                            Button(action: {
                                withAnimation{
                                    tetopiViewModel.isClosingTetopi = true
                                    tetopiViewModel.showPlayer = false
                                    tetopiViewModel.stopAudio()
                                }
                            }, label: {
                                Image(systemName: "xmark").resizable()
                                    .frame(width: 14, height: 14, alignment: .center)
                                    .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                            })
                            .padding(.trailing,22)
                        }
                    }
                }
                .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                .onTapGesture(perform: {
                    withAnimation(.spring()){
                        tetopiViewModel.expandFuper = true
                    }
                })
            }
        }
        .frame(height: tetopiViewModel.expandFuper ? nil :80)
        .background(
            VStack(spacing:0){
                Color.white
                    .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.2), radius: tetopiViewModel.expandFuper ? 0 : 1, x: 0, y: 0)
            }
        )
        .offset(y: CGFloat(tetopiViewModel.expandFuper ? 0 : tetopiViewModel.heightComperFromDashboard))
        .offset(y: tetopiViewModel.offsetFuper)
        .opacity(tetopiViewModel.isClosingTetopi ? 0 : 1)
        .gesture(DragGesture().onEnded(onEndedTetopi(value:)).onChanged(onChangedTetopi(value:)))
        .onTapGesture {
            if tetopiViewModel.showSpinnerPlayback{
                tetopiViewModel.showSpinnerPlayback = false
            }
        }
        
    }
    
    func onChangedTetopi(value: DragGesture.Value)
    {
        if value.translation.height > 0 && tetopiViewModel.expandFuper{
            tetopiViewModel.offsetFuper = value.translation.height
        }
    }
    
    func onEndedTetopi(value: DragGesture.Value)
    {
        if value.translation.height > height {
            tetopiViewModel.expandFuper = false
        }
        
        tetopiViewModel.offsetFuper = 0
    }
    
}


//struct TetopiComper_Previews: PreviewProvider {
//    static var previews: some View {
//        TetopiComper(animation: <#Namespace.ID#>, expandFuper: <#Binding<Bool>#>)
//        
//    }
//}
