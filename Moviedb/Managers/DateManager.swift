//
//  DateManager.swift
//  Moviedb
//
//  Created by Samir on 6/23/22.
//

import Foundation

struct DateManager {
    static func getDateFromAPI(string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat.apiDateFormat
        return dateFormatter.date(from: string)
    }
    
    static func getMonthDayYear(from date: Date?) -> String? {
        guard let date = date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormat.monthDayYearFormat
        return dateFormatter.string(from: date)
    }
}
