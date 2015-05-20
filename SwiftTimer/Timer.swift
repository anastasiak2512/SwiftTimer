//
//  Timer.swift
//  SwiftTimer
//
//  Created by AK on 21/10/14.
//  Copyright (c) 2014 JetBrains. All rights reserved.
//

import Foundation

class Timer {
    var mySecond: Int = 0
    var myMinute: Int = 0
    var myHour: Int = 0
    var myDay: Int = 0
    var timer = NSTimer()
    
    var handler: (String) -> ()
    
    init(handler: (String) -> ()) {
        self.handler = handler
    }
    
    deinit {
        self.timer.invalidate()
    }
    
    func stop () {
        timer.invalidate()
    }
    
    func setTimerHandler(handler: (String) -> ()) {
        self.handler = handler
    }
    
    func start() {
        (mySecond, myMinute, myHour, myDay) = (0, 0, 0, 0)
        let time_str = "00:00:00:00"
        self.handler(time_str)
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick:", userInfo: nil, repeats: true)
    }
   
    @objc func tick(timer:NSTimer!) {
        mySecond++
        if mySecond >= 60 {
            mySecond = 0
            myMinute++
        }
        if myMinute >= 60 {
            myMinute = 0
            myHour++
        }
        if myHour >= 24 {
            myHour = 0
            myDay++
        }
        let timeStr = NSString(format: "%.2d:%.2d:%.2d:%.2d", myDay, myHour, myMinute, mySecond)
        self.handler(timeStr as String)
    }
    
    func getLastTime() -> timeData! {
        return (mySecond, myMinute, myHour, myDay)
    }
}
