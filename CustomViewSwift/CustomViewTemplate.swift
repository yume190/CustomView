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
    func processFuture()
    
    func className() -> String
}

protocol CustomViewProtocol:CustomViewTemplateProtocol{
    func instantiateWithXib()
    func bundleIdentifier() -> String
    func frameworkBundle() -> NSBundle
}

@IBDesignable
class CustomViewTemplate: UIView ,CustomViewTemplateProtocol{
    
    @IBInspectable var viewSourceKeyPath:String?
    @IBInspectable var viewSourceDictionary:NSDictionary?
    
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
    
    func setup() {}
    
    override func prepareForInterfaceBuilder() {
        self.viewLiveRendering()
    }
    
    override func drawRect(rect: CGRect) {
        self.viewLiveRendering()
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
        
        if respondsToSelector(Selector("processFuture")){
            processFuture()
        }
    }
    
    func processViewSource() {}
    func processFuture() {}
    
    func instantiateWithXib(){
        
        var bundle:NSBundle = frameworkBundle()
        
        var nib:UINib = UINib(nibName: className(), bundle: bundle)
        
        nib.instantiateWithOwner(self, options: nil)
    }
    
    func frameworkBundle() -> NSBundle{
        return NSBundle(identifier: bundleIdentifier())!
    }
    
    func bundleIdentifier() -> String{
        //Bundle Identifier can be find at Target -> Your Framework -> Bundle Identifier
        return "com.yume190.CustomViewSwift"
    }
    
    func className() -> String{
        return ""
    }
}
