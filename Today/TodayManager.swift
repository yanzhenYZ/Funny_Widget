//
//  TodayManager.swift
//  CirclePrj
//
//  Created by yanzhen on 2020/10/17.
//

import UIKit
import WidgetKit
import YZIPhoneDevice

class TodayManager {
    var sub = 1
    static let manager = TodayManager()
    private init() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
            WidgetCenter.shared.reloadAllTimelines()
            guard let self = self else { return }
            self.sub += 1
        }
        RunLoop.current.add(timer, forMode: .common)
    }
    
}
