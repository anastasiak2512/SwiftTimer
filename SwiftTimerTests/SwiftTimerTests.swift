//
//  SwiftTimerTests.swift
//  SwiftTimerTests
//
//  Created by AK on 14/10/14.
//  Copyright (c) 2014 JetBrains. All rights reserved.
//

import UIKit
import XCTest

import SwiftTimer

class SwiftTimerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func timer_handler_start(str:String) {
        XCTAssert(str == "00:00:00:00", "Pass")
    }
    
    func timer_handler_tick(str:String) {
        XCTAssert(str == "00:00:00:01", "Pass")
    }
    
    func timer_handler_tick_false(str:String) {
        XCTAssert(str == "00:00:00:00", "Fail")
    }
    
    func timer_handler_tick_two(str:String) {
        XCTAssert(str == "00:00:00:02", "Pass")
    }
    
    func testStartTimer() {
        let swTimer = Timer(handler: timer_handler_start)
        swTimer.start()
    }
    
    func testTickTimer() {
        let timer = NSTimer()
        let swTimer = Timer(handler: timer_handler_tick)
        swTimer.tick(timer)
    }
    
    func testSeveralTimerTicks() {
        let timer = NSTimer()
        let swTimer = Timer(handler: timer_handler_tick)
        swTimer.tick(timer)
        swTimer.setTimerHandler(timer_handler_tick_two)
        swTimer.tick(timer)
    }
    
    func testWrongTimerTick() {
        let timer = NSTimer()
        let swTimer = Timer(handler: timer_handler_tick)
        swTimer.tick(timer)
        swTimer.setTimerHandler(timer_handler_tick_false)
        swTimer.tick(timer)

    }
    
    func testPerformance() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
