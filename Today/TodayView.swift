//
//  TodayView.swift
//  TodayExtension
//
//  Created by yanzhen on 2020/10/13.
//

import SwiftUI
import WidgetKit

struct TodayView: View {
    @State private var progress: CGFloat = 0
    @State private var subTitle = "0%"
    
    var body: some View {
        HStack {
            YZCircleView(title: "CPU", subTitle: $subTitle, progress: $progress)
            YZCircleView(title: "neicun", subTitle: $subTitle, progress: $progress)
            YZCircleView(title: "Wift", subTitle: $subTitle, progress: $progress)
        }
        
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
