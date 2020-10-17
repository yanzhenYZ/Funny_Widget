//
//  Today.swift
//  Today
//
//  Created by yanzhen on 2020/10/13.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    // 占位视图，是一个标准的 SwiftUI View
    func placeholder(in context: Context) -> TodayEntry {
        return TodayEntry(date: Date())
    }

    // 添加小组件时显示的内容
    func getSnapshot(in context: Context, completion: @escaping (TodayEntry) -> Void) {
        // 取数据
        let entry = TodayEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<TodayEntry>) -> Void) {
        let entry = TodayEntry(date: Date())
        // policy决定了什么时候刷新数据
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct TodayEntry: TimelineEntry {
    let date: Date
    
}

struct TodayEntryView : View {
    let entry: TodayEntry
    var body: some View {
        Text(entry.date.timeIntervalSince1970.description)
    }
}

@main
struct Today: Widget {
    let kind: String = "Today"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TodayEntryView(entry: entry)
        }
        .configurationDisplayName("Funny")
        .description("看到你也得不到")
        .supportedFamilies([.systemMedium])
    }
}

struct Today_Previews: PreviewProvider {
    static var previews: some View {
        TodayEntryView(entry: TodayEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
