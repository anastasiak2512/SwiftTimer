//
//  Results.swift
//  SwiftTimer
//
//  Created by AK on 21/10/14.
//  Copyright (c) 2014 JetBrains. All rights reserved.
//

import Foundation
//
//import class Foundation
//import var Darwin.errno

enum WeekDays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

typealias timeData = (sec:Int, min:Int,
                       hour:Int, day:Int)

class Results {

    var resultedSet: [timeData] = []
    
    func addResult(res: timeData) {
        resultedSet.append(res)
    }
    
    func size() -> Int {
        return resultedSet.count
    }

    func getResult(index:Int) -> String? {
        if resultedSet.count > index {
            let timeVal = resultedSet[index]
            let timeStr = NSString(format: "%.2d:%.2d:%.2d:%.2d", timeVal.day, timeVal.hour, timeVal.min, timeVal.sec)
            return timeStr as String
        } else {
            return nil
        }
    }

    //TODO: finish function
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty {
            return nil
        }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1 ..< array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }


    func handle(val: Int) {
        //...
//        minMax(resultedSet)
    }

    func foo() {
        let numInt = 7
        let numStr = "7"

        handle(numInt)

        var length = 7
        var width = 3

        println("The rectangle has a length of \(length) and a width of \(width), " +
                "giving it an area of \(length * width).")

    }
}

class TimerResults : Results {

}

class History : Results {

}


