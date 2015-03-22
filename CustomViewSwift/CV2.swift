//
//  CV2.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/19.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

class CV2: CustomViewStyle {

    override func setup() {
        super.setup()
        var label = UILabel(frame: CGRectMake(20, 20, 100, 50))
        label.text = "test"
        self.view?.addSubview(label)
    }

}
