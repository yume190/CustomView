//
//  ViewSource.swift
//  apsmswift
//
//  Created by APP559 on 2014/8/11.
//  Copyright (c) 2014年 yume. All rights reserved.
//

import UIKit

var ViewSourceInstance: ViewSource {
get{
    return ViewSource.sharedInstance
}
}

class ViewSource: NSObject {
    
    class var sharedInstance: ViewSource {
    dispatch_once(&Inner.token) {
        Inner.instance = ViewSource()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ViewSource?
        static var token: dispatch_once_t = 0
    }
    
    func TestView1() -> NSDictionary{
        return ["type":"YumeButton",
            "buttonTitle":"Push Me!!"]
    }
    
    func TestView2() -> NSDictionary{
        return ["type":"YumeButton",
            "buttonTitle":"Push abc!!"]
    }
    
    func TestView3() -> NSDictionary{
        return ["type":"YumeButton",
            "buttonTitle":"Push def!!"]
    }
    
}
