//
//  YZCircleView.swift
//  CircleView
//
//  Created by yanzhen on 2020/10/13.
//

import SwiftUI
import WidgetKit

//Circle()
//.stroke(Color.gray, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
private let CWIDTH: CGFloat = 80
struct YZCircleView: View {
    var title: String
    @Binding var subTitle: String
    @Binding var progress: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 2))
                .frame(width: CWIDTH, height: CWIDTH)
                        
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color(red: 1, green: 133/255.0, blue: 25/255.0),
                    style: StrokeStyle(lineWidth: 2))
                .rotationEffect(Angle(degrees: 270))
                .frame(width: CWIDTH, height: CWIDTH)
            VStack {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(Color.blue)
                    .frame(height: 20.0)
                
                Text(subTitle)
                    .font(.system(size: 13))
                    .frame(height: 20.0)
            }
        }
    }
}

struct YZCircleView_Previews: PreviewProvider {
    static var previews: some View {
        YZCircleView(title: "CPU", subTitle: .constant("20%"), progress: .constant(0.2))
            .previewContext(WidgetPreviewContext(family: .systemMedium))

    }
}
