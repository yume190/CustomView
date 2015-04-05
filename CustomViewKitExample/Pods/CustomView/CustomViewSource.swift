//
//  CustomViewSource.swift
//  Pods
//
//  Created by Yume on 2015/4/4.
//
//

import UIKit

public class CustomViewSource: CustomViewLight {
    
}

public extension CustomViewSource{
    @IBInspectable public var viewSource:String{
        set{
            if let sources = ViewSourcesInstance.valueForKeyPath(newValue) as? [ViewSource] {
                for source in sources{
                    source.action(self)
                }
            }
        }
        get{ return "" }
    }
}