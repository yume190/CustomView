//
//  CustomViewProtocol.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/19.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

protocol CustomViewBundle {
    func frameworkBundle() -> NSBundle?
    func bundleIdentifier() -> String
    func className() -> String
}