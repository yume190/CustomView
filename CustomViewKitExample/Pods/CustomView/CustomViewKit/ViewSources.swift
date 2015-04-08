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

@objc public class YumeViewSource<T>:DummyViewSource,ViewSource{
    public typealias SettingClosure = (T) -> ()
    
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

//public class KeyPathSource:NSObject{
//    private var _keyPath:String
//    init(keyPath:String) {
//        _keyPath = keyPath
//        super.init()
//    }
//}
//
//public class UILabelSource:KeyPathSource,ViewSource{
//    public typealias View = UILabel
//    public typealias SettingClosure = ((View) -> ())
//
//    private var _settings: SettingClosure
//    init(keyPath:String,setting:SettingClosure){
//        _settings = setting
//        super.init(keyPath: keyPath)
//    }
//
//    public func action(cv:CustomViewLight){
//        if let _view = cv.valueForKey(_keyPath) as? View {
//            _settings(_view)
//        }
//    }
//
//}



//            UIProgressView
//            UIActivityIndicatorView
//            UIActionSheet
//            UIAlertView
//            UITabBar
//            UIToolbar
//            UINavigationBar
//            UISearchBar
//            UIButton
//            UIRefreshControl
//            UIPageControl
//            UIStepper
//            UISlider
//            UISegmentedControl
//            UISwitch
//            UITextField
//            UIDatePicker
//            UIPickerView
//            UIWebView
//            UITextView
//            UITableView
//            UITableViewCell
//            UICollectionView
//            UICollectionViewCell
//            UITableViewHeaderFooterView
//            UIImageView

//public class KeyPathSource:NSObject{
//    private var _keyPath:String?
//    public func set(#keyPath: String){
//        _keyPath = keyPath
//    }
//}

//public class UILabel2Source:KeyPathSource,ViewSource{
//    public typealias View = UILabel
//    public typealias SettingClosure = ((UILabel) -> ())
//
//    private var _settings: SettingClosure?
//    public func set(#settings:SettingClosure){
//        _settings = settings
//    }
//
//    public func action(cv:CustomViewLight){
//        if _keyPath == nil || _settings == nil {
//            return
//        }
//
//        if let _view = cv.valueForKey(_keyPath!) as? View {
//            _settings!(_view)
//        }
//    }
//
//}

//public class UILabelSource: NSObject, ViewSource {
//
//    public typealias View = UILabel
//    public typealias SettingClosure = ((View) -> ())
//
//    private var _key:String?
//    public func set(#key: String) -> UILabelSource{
//        _key = key
//        return self
//    }
//
//    private var _settings: SettingClosure?
//    public func set(#settings:SettingClosure) -> UILabelSource{
//        _settings = settings
//        return self
//    }
//
//    public func action(cv:CustomViewLight){
//        if _key == nil || _settings == nil {
//            return
//        }
//
//        if let _view = cv.valueForKey(_key!) as? View {
//            _settings!(_view)
//        }
//    }
//
//}

//public class YumeViewSource<T>:NSObject,ViewSource{
//    public typealias View = T
//    public typealias SettingClosure = ((View) -> ())
//
//    public var _key:String?
//    public func set(#key: String) -> YumeViewSource<T>{
//        _key = key
//        return self
//    }
//
//    private var _settings: SettingClosure?
//    public func set(#settings:SettingClosure) -> YumeViewSource<T>{
//        _settings = settings
//        return self
//    }
//
//    public func action(cv:CustomViewLight){
//        if _key == nil || _settings == nil {
//            return
//        }
//
//        if let _view = cv.valueForKey(_key!) as? View {
//            _settings!(_view)
//        }
//    }
//
//}

