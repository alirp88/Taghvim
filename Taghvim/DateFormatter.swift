//
//  DateFormatter.swift
//  Taghvim
//
//  Created by Ali Riahipour on 17.09.20.
//

import Foundation

extension DateFormatter {
    private static let persianDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fa_IR")
        formatter.calendar = .init(identifier: .persian)
        return formatter
    }()

    private static let islamicDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fa_IR")
        formatter.calendar = .init(identifier: .islamic)
        return formatter
    }()

    private static let gregorianDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fa_IR")
        formatter.calendar = .init(identifier: .gregorian)
        return formatter
    }()

    enum CalendarType {
        case persian
        case islamic
        case gregorian

        var dateFormatter: DateFormatter {
            switch self {
            case .persian:
                return .persianDateFormatter
            case .islamic:
                return .islamicDateFormatter
            case .gregorian:
                return .gregorianDateFormatter
            }
        }
    }

    enum DateSpecifier {
        case month
        case year
        case dayOfWeek
        case date

        var characters: String {
            switch self {
            case .month:
                return "MMM"
            case .date:
                return "d"
            case .dayOfWeek:
                return "EEEE"
            case .year:
                return "yyyy"
            }
        }
    }

    static func string(calendarType: CalendarType, dateSpecifier: DateSpecifier, from date: Date) -> String {
        calendarType.dateFormatter.dateFormat = dateSpecifier.characters
        return calendarType.dateFormatter.string(from: date)
    }
}
