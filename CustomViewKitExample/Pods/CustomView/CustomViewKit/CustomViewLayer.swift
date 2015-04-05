//
//  CustomView2.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/20.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomViewLayer: CustomViewSource {
    
    @IBInspectable public var borderColor: UIColor? {
        didSet {
            if let color = borderColor {
                layer.borderColor = color.CGColor
            }
        }
    }
    @IBInspectable public var borderWidth: CGFloat = CGFloat.infinity { didSet { layer.borderWidth = borderWidth }}
    
    @IBInspectable public var cornerRadius: CGFloat = CGFloat.infinity { didSet { layer.cornerRadius = cornerRadius }}
    
    @IBInspectable public var shadowColor: UIColor? {
        didSet {
            if let color = shadowColor{
                layer.shadowColor = color.CGColor
            }
        }
    }
    @IBInspectable public var shadowRadius: CGFloat = CGFloat.infinity { didSet { layer.shadowRadius = shadowRadius }}
    @IBInspectable public var shadowOpacity: Float = Float.infinity { didSet { layer.shadowOpacity = shadowOpacity }}
    @IBInspectable public var shadowOffsetY: CGFloat = CGFloat.infinity { didSet { layer.shadowOffset.height = shadowOffsetY }}
    
}
