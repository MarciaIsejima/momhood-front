//
//  NSDate+DateParts.swift
//  momhood3
//
//  Created by laptop on 2019-07-11.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation
extension Date {
    func month() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }

    func day() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }

    //function to replace startOfDay because of timezone problems
    func startOf(_ dateComponent : Calendar.Component) -> Date {
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        var startOfComponent = self
        var timeInterval : TimeInterval = 0.0
        calendar.dateInterval(of: dateComponent, start: &startOfComponent, interval: &timeInterval, for: self)
        return startOfComponent
    }
    
}

