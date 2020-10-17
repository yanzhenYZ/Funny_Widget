//
//  Today.swift
//  Today
//
//  Created by yanzhen on 2020/10/13.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    //启动
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
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)//数据传输--001
    }
}

struct PlaceholderView : View {
    var body: some View {
        Text("Loading...")
    }
}

struct TodayEntry: TimelineEntry {
    let date: Date
    let manager = TodayManager.manager
}

struct TodayEntryView : View {
    let entry: TodayEntry
    var body: some View {
        TodayView()
    }
}

@main
struct Today: Widget {
    let kind: String = "Today"

    var body: some WidgetConfiguration {//数据接收--001
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
