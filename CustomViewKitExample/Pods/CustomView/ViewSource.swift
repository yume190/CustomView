//
//  ViewSource.swift
//  Pods
//
//  Created by Yume on 2015/4/4.
//
//

import UIKit

public var ViewSourcesInstance: ViewSources { get { return ViewSources.sharedInstance } }

public class ViewSources: NSObject {
    
    public typealias ViewSourceArray = [ViewSource]
    
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
    
    lazy var _dict:[String:ViewSourceArray] = ["yume1":self.yume1()]
    public func dict(key:String) -> ViewSourceArray{
        return _dict[key]!
    }
    
    public func yume1() -> ViewSourceArray {
        var label1 = UILabelSource(keyPath: "label1") { (View) -> () in
            View.text = "12345"
        }
        var label2 = UILabelSource(keyPath: "label2") { (UILabel) -> () in
            UILabel.text = "67890"
        }
        var label3 = UILabelSource(keyPath: "label3") { (View) -> () in
            View.text = "abcde"
        }
        return [label2,label1,label3]
    }
    
    public func yume2() -> ViewSourceArray {
        var label1 = UILabelSource(keyPath: "label1") { (View) -> () in
            View.text = "aaaaa"
        }
        var label2 = UILabelSource(keyPath: "label2") { (UILabel) -> () in
            UILabel.text = "bbbbb"
        }
        var label3 = UILabelSource(keyPath: "label3") { (View) -> () in
            View.text = "ccccc"
        }
        return [label2,label1,label3]
    }
    
    public func yume3() -> ViewSourceArray {
        var label1 = UILabelSource(keyPath: "label1") { (View) -> () in
            View.text = "100"
        }
        var label2 = UILabelSource(keyPath: "label2") { (UILabel) -> () in
            UILabel.text = "200"
        }
        var label3 = UILabelSource(keyPath: "label3") { (View) -> () in
            View.text = "300"
        }
        return [label2,label1,label3]
    }
    
    override public func valueForUndefinedKey(key: String) -> AnyObject? {
        return nil
    }
    
}

@objc public protocol ViewSource:class{
    func action(cv:CustomViewLight)
}

public class KeyPathSource:NSObject{
    private var _keyPath:String
    init(keyPath:String) {
        _keyPath = keyPath
        super.init()
    }
}

public class UILabelSource:KeyPathSource,ViewSource{
    public typealias View = UILabel
    public typealias SettingClosure = ((View) -> ())
    
    private var _settings: SettingClosure
    init(keyPath:String,setting:SettingClosure){
        _settings = setting
        super.init(keyPath: keyPath)
    }
    
    public func action(cv:CustomViewLight){
        if let _view = cv.valueForKey(_keyPath) as? View {
            _settings(_view)
        }
    }
    
}

//@objc public class YumeViewSource<T>:ViewSource{
//    public typealias SettingClosure = ((T) -> ())
//    
//    private var _settings: SettingClosure
//    public init(setting:SettingClosure){
//        _settings = setting
//    }
//    
//    public func action(cv:CustomViewLight){
//        println("\(cv) is \(cv is T)")
//        
//        if let _view = cv as? T {
//            _settings(_view)
//            
//        }
//    }
//    
//}
//var a = YumeViewSource<CV3>(setting: { (View) -> () in
//    View.label1.text = "1234"
//    View.label2.text = "2345"
//    View.label3.text = "3456"
//})


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
