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
    var wifiSubTitle = "0B/s"
    var wifiTitle = "Wifi"
    var memoryUsageStr = "0G/128G"
    var memoryUsage: CGFloat = 0
    var cpuUsageStr = "0%"
    var cpuUsage: CGFloat = 0
    static let manager = TodayManager()
    
    private var cpu: YZCPU!
    private var network: YZNetwork!
    private init() {
        cpu = YZCPU()
        cpu.startMonitorCPUUsage(withTimeInterval: 1.0) { [weak self] (usage) in
            self?.cpuUsage = usage
            self?.cpuUsageStr = String(format: "%.1f", usage * 100) + "%"
            
            let availableSize = YZDevice.getAvailableDiskSize()
            let totalSize = YZDevice.getTotalDiskSize()
            self?.memoryUsageStr = String(format: "%.1fG/%.1fG", CGFloat(availableSize) / 1024.0 / 1024 / 1024,CGFloat(totalSize) / 1024.0 / 1024 / 1024)
            self?.memoryUsage = 1 - CGFloat(availableSize) / CGFloat(totalSize)
            
            self?.reloadAllTimelines()
        }
        
        network = YZNetwork()
        network.getCurrentNetSpeed { [weak self] (netWorkFlux) in
            let titles = ["无网络","Wifi","4G","3G","2G"]
            self?.wifiTitle = titles[Int(netWorkFlux!.netStatus.rawValue)]
            self?.wifiSubTitle = self?.stringFromBytes(received: netWorkFlux!.received) ?? "0B/s"
            self?.reloadAllTimelines()
        }
    
    }
    
}

private extension TodayManager {
    func reloadAllTimelines() {
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    private func stringFromBytes(received: Float) ->String {
        let KB: Float = 1024.0;
        let MB = KB * 1024;
        let GB = MB * 1024;
        var speed = "0B/s";
        
        if received >= GB {
            speed = String(format: "%.1fG/s", received / GB);
        }else if received >= MB {
            speed = String(format: "%.1fM/s", received / MB);
        }else if received >= KB {
            speed = String(format: "%.1fKB/s", received / KB);
        }else{
            speed = String(format: "%.0fB/s", received);
        }
        return speed;
    }
}
