//
//  Pregnancy.swift
//  momhood3
//
//  Created by laptop on 2019-07-18.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

var pregnancy = Pregnancy(firstDayOfWeek: [], daysToGo: 0)

struct Pregnancy {
    var firstDayOfWeek: [Date]
    var daysToGo: Int
}



// the DataImporter instance for the importer property has not yet been created
func calculatePregnancyParameters(for expectedDueDate:Date) {
    // function that calculates pregnancy weeks dates and days remaining to due date based on user's data
    
    pregnancy.firstDayOfWeek.removeAll()
    
    //calculate first day of pregnancy
    
    let firstDayOfPregnancy = Calendar.current.date(byAdding: .day, value: -280, to: expectedDueDate)
//    print(firstDayOfPregnancy)
    
    //calculate first day of each pregnancy week
    var firstDayOfWeek = firstDayOfPregnancy
    let currentDate = Date().startOf(.day)
    var diff = Calendar.current.dateComponents([.day], from:firstDayOfWeek!, to: currentDate).day
    while diff! >= 0 {
        pregnancy.firstDayOfWeek.append(firstDayOfWeek!)
        firstDayOfWeek = Calendar.current.date(byAdding: .day, value: 7, to: firstDayOfWeek!)
        diff = Calendar.current.dateComponents([.day], from:firstDayOfWeek!, to: currentDate).day
    }
//    for (index, firstDay) in pregnancy.firstDayOfWeek.enumerated() {
//        print(index)
//        print(firstDay)
//    }
//
    //calculate how many days to go
    pregnancy.daysToGo = Calendar.current.dateComponents([.day], from:currentDate, to: expectedDueDate).day!
    
}

func getDate(dateString: String ) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale.current
    return dateFormatter.date(from: dateString)?.startOf(.day) // replace Date String
}
