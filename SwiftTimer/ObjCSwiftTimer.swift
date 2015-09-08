//
//  ObjCSwiftTimer.swift
//  SwiftTimer
//
//  Created by AK on 12/05/15.
//  Copyright (c) 2015 JetBrains. All rights reserved.
//

import Foundation

@objc class MyClass: NSObject {
    var property:String?
    
    init(str:String) {
        property = str
    }
    
    func method() {
        let myObjClass: ObjCCallClass = ObjCCallClass()
        myObjClass.property = "Calling ObjC code!"
        myObjClass.method()
    }
}
