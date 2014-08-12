//
//  CustomViewTemplate.swift
//  APSMSwift
//
//  Created by Yume on 2014/8/3.
//  Copyright (c) 2014年 yume. All rights reserved.
//

import UIKit

protocol CustomViewTemplateProtocol{
    func setup()
    func viewLiveRendering()
    
    func processViewSource()
    //    func processStoryBoardSource()
    func processFuture()
    
    func className() -> String
}

protocol CustomViewProtocol:CustomViewTemplateProtocol{
    func instantiateWithXib()
    func bundleIdentifier() -> String
}

@IBDesignable
class CustomViewTemplate: UIView ,CustomViewTemplateProtocol{
    
    @IBInspectable var viewSourceKeyPath:String?
    @IBInspectable var viewSourceDictionary:NSDictionary?
    //    @IBInspectable var viewSourceDictionary:[String:AnyObject]?
    
    @IBInspectable var borderLineWidth: CGFloat = 0 {
        willSet{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderRadius: CGFloat = 0 {
        willSet{
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        willSet{
            layer.borderColor = newValue.CGColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder : NSCoder) {
        super.init(coder:coder)
        setup()
    }
    
    func setup() {
        instantiateWithXib()
    }
    
    var token: dispatch_once_t = 0
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        dispatch_once(&token) {
            self.viewLiveRendering()
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        dispatch_once(&token) {
            self.viewLiveRendering()
        }
    }
    
    func viewLiveRendering() {
        if respondsToSelector(Selector("processViewSource")){
            if viewSourceKeyPath != nil{
                viewSourceDictionary = ViewSourceInstance.valueForKeyPath(viewSourceKeyPath!) as? NSDictionary
                
                let type:NSString? = viewSourceDictionary!["type"] as? NSString
                
                if type!.isEqualToString(className()) {
                    processViewSource()
                }
            }
        }
        
//        if respondsToSelector(Selector("processStoryBoardSource")){
//            processStoryBoardSource()
//        }
        
        if respondsToSelector(Selector("processFuture")){
            processFuture()
        }
    }
    
    func processViewSource() {}
    func processStoryBoardSource() {}
    func processFuture() {}
    
    func instantiateWithXib(){
//        var nibName1:NSString = NSStringFromClass(self.dynamicType)
//        var nibName2:NSString = NSStringFromClass(self.classForKeyedArchiver)
        
        var bundle:NSBundle = NSBundle(identifier: bundleIdentifier())
        
        var nib:UINib = UINib(nibName: className(), bundle: bundle)
        
        nib.instantiateWithOwner(self, options: nil)
    }
    
    func bundleIdentifier() -> String{
        return "com.yume190.YumeKit"
    }
    
    func className() -> String{
        return ""
    }
}
