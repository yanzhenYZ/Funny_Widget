//
//  TodayView.swift
//  TodayExtension
//
//  Created by yanzhen on 2020/10/13.
//

import SwiftUI
import WidgetKit

struct TodayView: View {
    @State private var progress: CGFloat = 0.2
    @State private var subTitle = "20%"
    
    var body: some View {
        HStack {
            Spacer()
            YZCircleView(title: "CPU", subTitle: $subTitle, progress: $progress)
            Spacer()
            YZCircleView(title: "neicun", subTitle: $subTitle, progress: $progress)
            Spacer()
            YZCircleView(title: "Wift", subTitle: $subTitle, progress: $progress)
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
