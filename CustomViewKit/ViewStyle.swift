//
//  ViewStyle.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/15.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

public var ViewStyleInstance: ViewStyles { get { return ViewStyles.sharedInstance } }

public class ViewStyle{
    public var borderColor:UIColor?
    public var borderWidth:CGFloat?
    public var cornerRadius:CGFloat?
    public var shadowColor:UIColor?
    public var shadowRadius:CGFloat?
    public var shadowOpacity:Float?
    public var shadowOffsetY:CGFloat?
    
    public func setBorderColor(color:UIColor) -> ViewStyle{
        borderColor = color
        return self
    }
    
    public func setBorderWidth(width:CGFloat) -> ViewStyle{
        borderWidth = width
        return self
    }
    
    public func setCornorRadius(radius:CGFloat) -> ViewStyle{
        cornerRadius = radius
        return self
    }
    
    public func setShadowColor(color:UIColor) -> ViewStyle{
        shadowColor = color
        return self
    }
    
    public func setShadowRadius(radius:CGFloat) -> ViewStyle{
        shadowRadius = radius
        return self
    }
    
    public func setShadowOpacity(opacity:Float) -> ViewStyle{
        shadowOpacity = opacity
        return self
    }
    
    public func setShadowOffsetY(offset:CGFloat) -> ViewStyle{
        shadowOffsetY = offset
        return self
    }
        
}

public class ViewStyles: NSObject {
    
    public class var sharedInstance: ViewStyles {
        dispatch_once(&Inner.token) {
            Inner.instance = ViewStyles()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ViewStyles?
        static var token: dispatch_once_t = 0
    }
    
    public func none() -> ViewStyle{
        return ViewStyle().setBorderColor(UIColor.clearColor())
                          .setBorderWidth(0)
                          .setCornorRadius(0)
                          .setShadowColor(UIColor.clearColor())
                          .setShadowRadius(0)
                          .setShadowOpacity(0)
                          .setShadowOffsetY(0)
    }
    
    public func fb() -> ViewStyle{
        return ViewStyle().setBorderWidth(10).setBorderColor(UIColor.blueColor()).setCornorRadius(20)
    }
    
    public func yume() -> ViewStyle{
        return ViewStyle().setBorderWidth(3).setBorderColor(UIColor.purpleColor()).setCornorRadius(30)
    }
    
    override public func valueForUndefinedKey(key: String) -> AnyObject? {
        return none()
    }
    
}