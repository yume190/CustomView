//
//  CustomViewC.swift
//  PodTest
//
//  Created by Yume on 2015/3/22.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import UIKit
import CustomView

extension CustomViewLight{
    public func bundleIdentifier() -> String{
        //Bundle Identifier can be find at Target -> Your Framework -> Bundle Identifier
        return "com.yume190.PodTest"
    }
}


extension ViewStyles {
    
    public func customStyle1() -> ViewStyle{
        return ViewStyle().set(borderWidth:20).set(borderColor:UIColor.darkGrayColor()).set(cornorRadius:20)
    }
    
    public func customStyle2() -> ViewStyle{
        return ViewStyle().set(borderWidth:30).set(borderColor:UIColor.greenColor()).set(cornorRadius:30)
    }
}