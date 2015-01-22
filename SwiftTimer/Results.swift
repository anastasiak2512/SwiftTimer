//
//  Results.swift
//  SwiftTimer
//
//  Created by AK on 21/10/14.
//  Copyright (c) 2014 JetBrains. All rights reserved.
//

import Foundation

//enum WeekDays {
//    case Monday
//    case Tuesday
//    case Wednesday
//    case Thursday
//    case Friday
//    case Saturday
//    case Sunday
//}

typealias timeTuple = (sec:Int, min:Int,
                       hour:Int, day:Int)

class Results {
//    class ChildResults {
//
//    }

    var resultSet: [timeTuple] = []
    
    func addResult(res:timeTuple) {
        resultSet.append(res)
    }
    
    func size() -> Int {
        return resultSet.count
    }

    func getResult(index:Int) -> String? {
        if resultSet.count > index {
            let timeVal = resultSet[index]
            let timeStr = NSString(format: "%.2d:%.2d:%.2d:%.2d", timeVal.day, timeVal.hour, timeVal.min, timeVal.sec)
            return timeStr
        } else {
            return nil
        }
    }
    
    func minMax(array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty { return nil }
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
//    func noahArk() {
//        let 🌍 = "🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩"
//        var 🚢: [String] = []
//        for 💕 in 🌍 {
//            🚢.append(💕 + 💕)
//        }
//
//    }
}

