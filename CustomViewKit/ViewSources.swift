//
//  ViewSources.swift
//  CustomViewTest
//
//  Created by Yume on 2015/4/8.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@objc public protocol ViewSource:class{
    func action(cv:CustomViewLight)
}

@objc public class ViewSources: NSObject {
    
    public class var sharedInstance: ViewSources {
        dispatch_once(&Inner.token) {
            Inner.instance = ViewSources()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ViewSources?
        static var token: dispatch_once_t = 0
    }
    
    override public func valueForUndefinedKey(key: String) -> AnyObject? {
        return nil
    }
    
}

public var ViewSourcesInstance: ViewSources { get { return ViewSources.sharedInstance } }

@objc public class DummyViewSource:ViewSource{
    public func action(cv:CustomViewLight){
    }
}

@objc public class YumeViewSource<T>:DummyViewSource{
    public typealias SettingClosure = ((T) -> ())
    
    private var _settings: SettingClosure
    public init(settings:SettingClosure){
        _settings = settings
    }
    
    public override func action(cv:CustomViewLight){
        if let _view = cv as? T {
            _settings(_view)
            
        }
    }
    
}
