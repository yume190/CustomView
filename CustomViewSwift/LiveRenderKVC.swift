//
//  LiveRenderKVC.swift
//  CustomViewTest
//
//  Created by Yume on 2014/9/11.
//  Copyright (c) 2014年 yume. All rights reserved.
//

import UIKit
@IBDesignable
class LiveRenderKVC: CustomViewTemplate {

    @IBOutlet var view: UIView!
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    
    
    override func setup() {
        super.setup()
        instantiateWithXib()
        self.addSubview(view)
    }
    
    override func className() -> String {
        return "LiveRenderKVC"
    }
    
    override func processViewSource() {
        labelLeft.text = viewSourceDictionary!["labelLeft"] as? String
        labelRight.text = viewSourceDictionary!["labelRight"] as? String
    }
}