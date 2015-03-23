//
//  CV1.swift
//  PodTest
//
//  Created by Yume on 2015/3/22.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import UIKit
import CustomView

class CV1: CustomViewLight {
   
    override func setup() {
        super.setup()
        var c = UILabel(frame: CGRectMake(0, 0, 100, 100))
        c.text="1000"
        self.view?.addSubview(c)
    }
    
}
