//
//  TextExtension.swift
//  AudioPlayerStreamingKompas
//
//  Created by TI Digital on 08/08/21.
//

import SwiftUI

extension Text{
    //MARK: - hind
    func hindBold12() -> Text{
        self
            .font(Font.custom("Hind-Bold", size: 14))
    }
    func hindBold14() -> Text{
        self
            .font(Font.custom("Hind-Bold", size: 14))
    }
    func hindBold16() -> Text{
        self
            .font(Font.custom("Hind-Bold", size: 16))
    }
    func hindBold18() -> Text{
        self
            .font(Font.custom("Hind-Bold", size: 18))
    }
    func hindBold20() -> Text{
        self
            .font(Font.custom("Hind-Bold", size: 20))
    }
    func hindSemiBold12() -> Text{
        self
            .font(Font.custom("Hind-SemiBold", size: 14))
    }
    func hindSemiBold14() -> Text{
        self
            .font(Font.custom("Hind-SemiBold", size: 14))
    }
    func hindSemiBold16() -> Text{
        self
            .font(Font.custom("Hind-SemiBold", size: 16))
    }
    func hindSemiBold18() -> Text{
        self
            .font(Font.custom("Hind-SemiBold", size: 18))
    }
    func hindMedium12() -> Text{
        self
            .font(Font.custom("Hind-Medium", size: 12))
    }
    func hindMedium14() -> Text{
        self
            .font(Font.custom("Hind-Medium", size: 14))
    }
    func hindMedium16() -> Text{
        self
            .font(Font.custom("Hind-Medium", size: 16))
    }
    func hindMedium18() -> Text{
        self
            .font(Font.custom("Hind-Medium", size: 18))
    }
    func hindRegular12() -> Text{
        self
            .font(Font.custom("Hind-Regular", size: 12))
    }
    func hindRegular14() -> Text{
        self
            .font(Font.custom("Hind-Regular", size: 14))
    }
    func hindRegular16() -> Text{
        self
            .font(Font.custom("Hind-Regular", size: 16))
    }
    func hindRegular18() -> Text{
        self
            .font(Font.custom("Hind-Regular", size: 18))
    }
    //MARK: - playfair
    func playfairBold14Black() -> Text{
        self
            .font(Font.custom("PlayfairDisplay-Bold", size: 14))
    }
    func playfairBold20Black() -> Text{
        self
            .font(Font.custom("PlayfairDisplay-Bold", size: 20))
    }
    //MARK: - Others
    func labelStyle() -> Text{
        self
            .foregroundColor(Color(UIColor(named: "ColorBlueKompas")!))
            .font(Font.custom("Hind-Bold", size: 12))
    }
    
}



