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

}

