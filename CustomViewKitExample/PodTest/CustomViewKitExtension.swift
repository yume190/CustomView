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

extension ViewSources {
    
    public func cv1Source1() -> ViewSource{
        return YumeViewSource<CV1>(){
            (CV1) -> () in
            CV1.label1.text = "100"
        }
    }
    
    public func cv1Source2() -> ViewSource{
        return YumeViewSource<CV1>(){
            (CV1) -> () in
            CV1.label1.text = "2000"
        }
    }
    
    public var cv2Source1:ViewSource
    {
        get {
            return YumeViewSource<CV2>(){
                (CV2) -> () in
                CV2.label1.text = "11111"
                CV2.label2.text = "22222"
                CV2.label3.text = "33333"
            }
        }
    }
    
    public func cv2Source2() -> ViewSource{
        return YumeViewSource<CV2>(){
            (CV2) -> () in
            CV2.label1.text = "abc"
            CV2.label2.text = "123"
            CV2.label3.text = "xyz"
        }
    }
}