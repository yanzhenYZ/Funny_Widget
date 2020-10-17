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
            YZCircleView(title: "CPU", subTitle: TodayManager.manager.sub.description, progress: $cpuProgress)
            Spacer()
            YZCircleView(title: "内存", subTitle: TodayManager.manager.sub.description, progress: $memoryProgress)
            Spacer()
            YZCircleView(title: "Wift", subTitle: TodayManager.manager.sub.description, progress: .constant(0))
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
