//
//  CustomViewWithSwift.swift
//  CustomViewTest
//
//  Created by Yume on 2014/6/3.
//  Copyright (c) 2014年 yume. All rights reserved.
//

import UIKit
@IBDesignable
class CustomViewWithSwift: UIView {
    
    @IBInspectable var lineWidth: NSInteger
    @IBInspectable var fillColor: UIColor
    @IBInspectable var labelColor: UIColor
    @IBInspectable var labelText: NSString = ""
    @IBInspectable var labelRect: CGRect
    
    override init(frame: CGRect) {
        lineWidth = 0
        fillColor = UIColor.blackColor()
        labelColor = UIColor.blackColor()
        labelText = NSString()
        labelRect = CGRect(x:0.0,y: 0.0,width: 200.0,height: 40.0)
        
        super.init(frame: frame)
    }
    
    required init(coder : NSCoder) {
        lineWidth = 0
        fillColor = UIColor.blackColor()
        labelColor = UIColor.blackColor()
        labelRect = CGRect(x:0.0,y: 0.0,width: 200.0,height: 40.0)
        
        super.init(coder:coder)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func drawRect(rect: CGRect)
    {
        var l:UILabel = UILabel()
        l.text = labelText
        l.frame = labelRect
        l.textColor = labelColor
        addSubview(l)
    }
}
