//
//  TodayView.swift
//  TodayExtension
//
//  Created by yanzhen on 2020/10/13.
//

import SwiftUI
import WidgetKit

struct TodayView: View {
    @State private var cpuProgress: CGFloat = 0.2
    @State private var memoryProgress: CGFloat = 0

    var body: some View {
        HStack {
            Spacer()
            YZCircleView(title: "CPU", subTitle: TodayManager.manager.cpuUsageStr, progress: TodayManager.manager.cpuUsage)
            Spacer()
            YZCircleView(title: "内存", subTitle: TodayManager.manager.memoryUsageStr, progress: TodayManager.manager.memoryUsage)
            Spacer()
            YZCircleView(title: TodayManager.manager.wifiTitle, subTitle: TodayManager.manager.wifiSubTitle, progress: 0)
            Spacer()
        }
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
