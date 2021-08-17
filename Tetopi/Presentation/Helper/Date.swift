//
//  DateFormat.swift
//  Search
//
//  Created by TI Digital on 23/07/21.
//

import Foundation


extension Date{
    /*
        *   Create locale datetime format and return as String
        *  Example input : 2017-11-29 (Date)
        *  Example output : 2017-11-29 17:56:00
        *  @param format as format time
    */
    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
/*
    *  Create locale ID datetime format in WIB, if time day is equals this day return only time and category
    *  if date is not equal this day return only date and categorys
    *  Example input : 2017-11-29 17:56:00
    *  Example output : 29 Nov 2017 · Internasional
    *  Example output if [time] is equals this day : 17:56 WIB · Internasional
    *  @param date as Timestamp
    *  @param category as Category
*/
func getDateWithCategory (date:String,category:String) -> String {
    var newDate = ""
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "dd MMMM yyyy"
    
    if let date = dateFormatterGet.date(from: date) {
        newDate = dateFormatterPrint.string(from: date) + " WIB"
    } else {
        print("There was an error decoding the string")
    }
    return newDate + " · " + category
}


/*
    *  Create locale ID datetime format in WIB, if time day is equals this day return only time and category
    *  if date is not equal this day return only date and categorys
    *  Example input : 2017-11-29 17:56:00
    *  Example output : 29 Nov 2017
    *  Example output if [time] is equals this day : 17:56 WIB
    *  @param date as Timestamp
    *  @param category as Category
*/
func getDateArticleList (date:String,category:String) -> String {
    var newDate = ""
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "dd MMMM yyyy"
    
    let timeWithoutSeconds = DateFormatter()
    timeWithoutSeconds.dateFormat = "HH:mm"
    
    let today = Date().getFormattedDate(format: "dd MMMM yyyy")
    
    let localListDate = DateFormatter()
    localListDate.dateFormat = "d MMM y · HH:mm"
    
    if let date = dateFormatterGet.date(from: date) {
        if today == dateFormatterPrint.string(from: date){
            newDate = timeWithoutSeconds.string(from: date) + " WIB"
        }
        else{
            newDate = localListDate.string(from: date) + "WIB"
        }
    } else {
        print("There was an error decoding the string")
    }
    return newDate + " · " + category
}

func getTimeTetopi (time:String) -> String {
    var newDate = ""
    let timeWithHours = DateFormatter()
    timeWithHours.dateFormat = "HH:mm:ss"
    
    let timeWithoutHours = DateFormatter()
    timeWithoutHours.dateFormat = "mm:ss"
    
    if let date = timeWithHours.date(from: time) {
            newDate = timeWithoutHours.string(from: date)
    } else {
        print("There was an error decoding the string")
    }
    return newDate
}
