//
//  Reflect.swift
//  CustomViewTest
//
//  Created by Yume on 2015/4/8.
//  Copyright (c) 2015年 yume. All rights reserved.
//
//
//import UIKit
//
//// https://github.com/ksm/SwiftInFlux
//// https://gist.github.com/peebsjs/9288f79322ed3119ece4
//infix operator --> {
//    associativity left
//}
//
//public func --> (instance: Any, key: String) -> Any? {
//    let mirror = reflect(instance)
//
//    for index in 0 ..< mirror.count {
//        let (childKey, childMirror) = mirror[index]
//        if childKey == key {
//            return childMirror.value
//        }
//    }
//
//    return nil
//}
