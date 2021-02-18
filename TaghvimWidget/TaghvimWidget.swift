//
//  TaghvimWidget.swift
//  TaghvimWidget
//
//  Created by Ali Riahipour on 17.09.20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []
        let calendar = Calendar.current
        let currentDate = Date()

        entries.append(.init(date: currentDate))
        for dayOffset in 1..<5 {
            let entryDate = calendar.startOfDay(for: calendar.date(byAdding: .day, value: dayOffset, to: currentDate)!)

            entries.append(.init(date: entryDate))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct TaghvimWidgetEntryView: View {
    var entry: Provider.Entry

    var body: some View {
        DateView(date: entry.date, calendarType: .persian)
    }
}

@main
struct TaghvimWidget: Widget {
    let kind: String = "TaghvimWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TaghvimWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("تقویم")
        .description("تقویم هجری شمسی")
    }
}

struct TaghvimWidget_Previews: PreviewProvider {
    static var previews: some View {
        TaghvimWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
