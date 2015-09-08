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


//    func getSq(ln:Int, _ wd:Int) {
//        let sq = ln * wd;
//        let pr = (ln + wd) * 2;
//
//        println("The rectangle has " +
//                "a length of \(ln) " +
//                "and a width of \(wd), " +
//                "giving it an area of \(sq)" +
//                "and perimeter of \(pr)")
//
//    }

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

        let swArray = ["first", "second"]
        let nsArray : NSArray = ["dog", "cat"]



        var curL = CFLocaleCopyCurrent()

        let curTime = getLastTime()
        let curSec = curTime.sec

        //getSq(3, 7)

        let timeStr = NSString(format: "%.2d:%.2d:%.2d:%.2d", curTime.day, curTime.hour, curTime.min, curTime.sec)
        self.handler(timeStr as String)

    }
    
    func getLastTime() -> timeData! {
        return (mySecond, myMinute, myHour, myDay)
    }
}
