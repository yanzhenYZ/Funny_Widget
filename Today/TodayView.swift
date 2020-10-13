//
//  TodayView.swift
//  TodayExtension
//
//  Created by yanzhen on 2020/10/13.
//

import SwiftUI
import WidgetKit
import YZIPhoneDevice

struct TodayView: View {
    @State private var cpuProgress: CGFloat = 0.2
    @State private var cpuSubTitle = "20%"
    @State private var memoryProgress: CGFloat = 0
    @State private var memorySubTitle = "0G/0G"
    @State private var wifiSubTitle = "0B/s"
    
    var body: some View {
        HStack {
            Spacer()
            YZCircleView(title: "CPU", subTitle: $cpuSubTitle, progress: $cpuProgress)
            Spacer()
            YZCircleView(title: "内存", subTitle: $memorySubTitle, progress: $memoryProgress)
            Spacer()
            YZCircleView(title: "Wift", subTitle: $wifiSubTitle, progress: .constant(0))
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
