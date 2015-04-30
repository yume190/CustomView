//
//  CustomView2.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/20.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomViewLight: UIView {
    
    public var view:UIView?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init(coder : NSCoder) {
        super.init(coder:coder)
        setup()
    }
    
    public func setup(){
        instantiateWithXib()
    }
    
    deinit{
        view = nil
    }
    
}

protocol CustomViewBundle {
    func frameworkBundle() -> NSBundle?
    func className() -> String
}

// MARK: Bundle
extension CustomViewLight: CustomViewBundle {
    
    public func frameworkBundle() -> NSBundle?{
        return NSBundle(forClass: self.classForCoder)
    }
    
    public func className() -> String{
        return String.className(self.classForCoder)
    }
    
    private func instantiateWithXib(){
        let bundle:NSBundle? = frameworkBundle()
        let nibUrl = bundle?.URLForResource(className(), withExtension: "nib")
        if bundle == nil || nibUrl == nil {
            insertBlankView()
            return
        }
        
        var nib:UINib = UINib(nibName: className(), bundle: bundle)
        var views = nib.instantiateWithOwner(self, options: nil)
        
        if count(views) >= 1 {
            if let view = views[0] as? UIView {
                matchTwoViewsUsingAutolayout(view)
            }
        }
    }
    
    private func insertBlankView(){
        var view = UIView(frame: CGRectMake(0, 0, 0, 0))
        matchTwoViewsUsingAutolayout(view)
    }
    
    private func matchTwoViewsUsingAutolayout(view:UIView) {
        self.view = view
        view.backgroundColor = UIColor.clearColor()
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(view)
        
        self <- view.top == self.top
        self <- view.bottom == self.bottom
        self <- view.trailing == self.trailing
        self <- view.leading == self.leading
    }
    
}
