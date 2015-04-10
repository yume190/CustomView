//
//  CustomViewSource.swift
//  CustomViewTest
//
//  Created by Yume on 2015/4/8.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

public class CustomViewSource: CustomViewLight {
    
}

public extension CustomViewSource{
    @IBInspectable public var viewSource:String{
        set{
            if let sources = ViewSourcesInstance.valueForKeyPath(newValue) as? DummyViewSource {
                sources.action(self)
            }
        }
        get{ return "" }
    }
}
