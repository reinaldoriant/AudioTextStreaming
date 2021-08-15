//
//  TetopiComper.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 14/08/21.
//

import SwiftUI

struct TetopiView: View {
    //MARK: - Properties
    //Animation Tetopi
    var animationTransition: Namespace.ID
    @Binding var expandFuper: Bool
    @Binding var heightPhone:Int
    @State var isCloseTetopi: Bool = false
    //Player audio Tetopi
    @State var isPlaying : Bool = false
    
    
    var body: some View{
        Group{
            //MARK: - Tetopi Fuper
            if expandFuper{
                withAnimation{
                    Group{
                        VStack(alignment: .center) {
                            //MARK: - Slug and button down
                            ZStack{
                                VStack{
                                    HStack{
                                        Button(action: {
                                                withAnimation{
                                                    expandFuper.toggle()}}, label: {
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
                                Image("imgMockTetopi")
                                    .resizable()
                                    .interpolation(.none)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 183,alignment: .center)
                                    .clipped()
                                    .padding(.bottom,16)
                                VStack {
                                    Text("Aku bangga jadi anak Indonesia")
                                        .multilineTextAlignment(.center)
                                        .font(Font.custom("PlayfairDisplay-Bold", size: 20))
                                        .lineLimit(3)
                                        .frame(width: 328, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                                Text(getDateWithCategory(date: "2021-08-15 14:41:05", category: "Nasional"))
                                    .hindMedium14()
                                    .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                            }.padding(.bottom, 83)
                            
                            //MARK: - Player Audio fuper
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
                                    Button(action: {isPlaying.toggle()}, label: {
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
                            
                            Spacer()
                            
                            //MARK: - Baca Artikel, List and speed audio fuper
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
                        .padding(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                    }
                }.transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
            }
            else {
                //MARK: - Tetopi Comper
                HStack{
                    //MARK: - Image Tetopi Comper
                    Image("imgMockTetopi")
                        .resizable()
                        .interpolation(.none)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipped()
                    
                    //MARK: - Title and date Tetopi Comper
                    VStack(alignment: .leading, spacing: 2){
                        Spacer()
                        Text("PM Rajoy beri waktu aku riset tetopi")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("PlayFairDisplay-Bold", size: 16))
                            .lineLimit(1)
                        
                        
                        Text(getDateArticleList(date: "2021-08-14 15:00:00", category: "International"))
                            .hindRegular12()
                            .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                        
                        Spacer()
                    }
                    .frame(width: 168)
                    .padding(.trailing,22)
                    Spacer()
                    
                    //MARK: - Player and close Tetopi Comper
                    HStack(spacing: 22) {
                        Button(action: {isPlaying.toggle()}, label: {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill").resizable()
                        })
                        .frame(width: 14, height: 14, alignment: .center)
                        .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
                        
                        Rectangle()
                            .frame(width: 1, height: 50)
                            .foregroundColor(Color(UIColor(named: "ColorGrayDDD")!))
                        Button(action: {isCloseTetopi.toggle()}, label: {
                            Image(systemName: "xmark").resizable()
                                .frame(width: 14, height: 14, alignment: .center)
                                .foregroundColor(Color(UIColor(named: "ColorGray666")!))
                        })
                        .padding(.trailing,22)
                    }
                }
                .onTapGesture(perform: {
                    withAnimation(.spring()){
                        expandFuper.toggle()
                    }
                })
            }
        }
        .frame(height: expandFuper ? .infinity:80)
        .background(
            VStack(spacing:0){
                Color.white
                    .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.2), radius: expandFuper ? 0 : 1, x: 0, y: 0)
            }
        )
        .ignoresSafeArea(.all, edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        .offset(y: CGFloat(expandFuper ? 0 : heightPhone))
        .opacity(isCloseTetopi ? 0 : 1)
    }
    
}


//struct TetopiComper_Previews: PreviewProvider {
//    static var previews: some View {
//        TetopiComper(animation: <#Namespace.ID#>, expandFuper: <#Binding<Bool>#>)
//        
//    }
//}
