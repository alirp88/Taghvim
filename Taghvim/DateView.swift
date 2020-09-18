//
//  DateView.swift
//  Taghvim
//
//  Created by Ali Riahipour on 17.09.20.
//

import SwiftUI

struct DateView: View {
    let date: Date
    let calendarType: DateFormatter.CalendarType
    var body: some View {
        VStack {
            Text(DateFormatter.string(calendarType: calendarType, dateSpecifier: .date, from: date))
                .font(.vazir(textStyle: .subheadline))
            Text(
                DateFormatter.string(calendarType: calendarType, dateSpecifier: .month, from: date)
                    + DateFormatter.string(calendarType: calendarType, dateSpecifier: .year, from: date))
                .font(.vazir(textStyle: .callout))
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(date: Date(), calendarType: .persian)
    }
}
