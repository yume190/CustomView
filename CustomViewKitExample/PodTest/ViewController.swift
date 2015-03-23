//
//  ViewController.swift
//  PodTest
//
//  Created by Yume on 2015/3/22.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cv1 = CV1(frame:CGRectMake(0, 0, 100, 100))
        cv1.backgroundColor = UIColor.brownColor()
        self.view.addSubview(cv1)
        
        var cv2 = CV2(frame:CGRectMake(0, 100, 150, 150))
        cv2.style = "yume"
        self.view.addSubview(cv2)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

