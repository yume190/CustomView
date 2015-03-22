//
//  CustomView2.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/20.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomViewLayerStyle: CustomViewLayer {
    
    @IBInspectable public var style:String = "none" {
        didSet{
            if let _style = ViewStyleInstance.valueForKey(style) as? ViewStyle {
                _viewStyle = _style
            }
        }
    }
    
}

// MARK: Style
public extension CustomViewLayerStyle {
    private func setViewStyle(vStyle:ViewStyle){
        println("set style")
        
        if let _borderColor = borderColor?.CGColor ?? vStyle.borderColor?.CGColor {
            layer.borderColor = _borderColor
        }
        
        if let _borderWidth = borderWidth != CGFloat.infinity ? borderWidth : vStyle.borderWidth {
            layer.borderWidth = _borderWidth
        }
        
        if let _cornerRadius = cornerRadius != CGFloat.infinity ? cornerRadius : vStyle.cornerRadius {
            layer.cornerRadius = _cornerRadius
        }
        
        if let _shadowRadius = shadowRadius != CGFloat.infinity ? shadowRadius : vStyle.shadowRadius{
            layer.shadowRadius = _shadowRadius
        }
        
        if let _shadowColor = shadowColor?.CGColor ?? vStyle.shadowColor?.CGColor{
            layer.shadowColor = _shadowColor
        }
        
        if let _shadowOpacity = shadowOpacity != Float.infinity ? shadowOpacity: vStyle.shadowOpacity{
            layer.shadowOpacity = _shadowOpacity
        }
        
        if let _shadowOffsetY = shadowOffsetY != CGFloat.infinity ? shadowOffsetY : vStyle.shadowOffsetY{
            layer.shadowOffset.height = _shadowOffsetY
        }
    }
    
    private var _viewStyle:ViewStyle{
        set{ setViewStyle(newValue) }
        get{ return ViewStyleInstance.none() }
    }
}
