//
//  ContentView.swift
//  Taghvim
//
//  Created by Ali Riahipour on 17.09.20.
//

import SwiftUI

struct ContentView: View {
    let date = Date()

    var body: some View {
        VStack {
            Spacer()
            Text(DateFormatter.string(calendarType: .persian, dateSpecifier: .dayOfWeek, from: date))
                .font(.vazir(textStyle: .headline))

            DateView(date: date, calendarType: .persian)
            Spacer()
            HStack {
                Spacer()
                DateView(date: date, calendarType: .islamic)
                Spacer()
                DateView(date: date, calendarType: .gregorian)
                Spacer()
            }
            .padding(30)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
