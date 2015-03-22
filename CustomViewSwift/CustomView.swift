//
//  CustomView.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/14.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

@IBDesignable
public class CustomView: UIView {
    
    var view:UIView?
    
    @IBInspectable var style:String = "none" {
        didSet{
            if let _style = ViewStyleInstance.valueForKey(style) as? ViewStyle {
                viewStyle = _style
            }
        }
    }
    
    @IBInspectable public var borderColor: UIColor? { didSet { layer.borderColor = borderColor?.CGColor }}
    @IBInspectable public var borderWidth: CGFloat? { didSet { layer.borderWidth = borderWidth! }}
    @IBInspectable public var cornerRadius: CGFloat? { didSet { layer.cornerRadius = cornerRadius! }}
    @IBInspectable public var shadowColor: UIColor? { didSet { layer.shadowColor = shadowColor?.CGColor }}
    @IBInspectable public var shadowRadius: CGFloat? { didSet { layer.shadowRadius = shadowRadius! }}
    @IBInspectable public var shadowOpacity: Float? { didSet { layer.shadowOpacity = shadowOpacity! }}
    @IBInspectable public var shadowOffsetY: CGFloat? { didSet { layer.shadowOffset.height = shadowOffsetY! }}
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init(coder : NSCoder) {
        super.init(coder:coder)
        setup()
    }
    
    func setup(){
        instantiateWithXib()
    }
    
    deinit{
        view = nil
    }
    
}


// MARK: Bundle
extension CustomView: CustomViewBundle {
    
    public func frameworkBundle() -> NSBundle?{
        return NSBundle(identifier: bundleIdentifier())
    }
    
    public func bundleIdentifier() -> String{
        //Bundle Identifier can be find at Target -> Your Framework -> Bundle Identifier
        return "com.yume190.CustomViewSwift"
    }
    
    public func className() -> String{
        return String.className(self.classForCoder)
    }
    
    func instantiateWithXib(){
        let bundle:NSBundle? = frameworkBundle()
        let nibUrl = bundle?.URLForResource(className(), withExtension: "nib")
        if bundle == nil || nibUrl == nil {
            insertBlankView()
            return
        }
        
        var nib:UINib = UINib(nibName: className(), bundle: bundle)
        var views = nib.instantiateWithOwner(self, options: nil)
        
        if countElements(views) >= 1 {
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
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(view)
        
        self <- view.top == self.top
        self <- view.bottom == self.bottom
        self <- view.trailing == self.trailing
        self <- view.leading == self.leading
    }
    
}

// MARK: Style
public extension CustomView {
    private func setViewStyle(vStyle:ViewStyle){
        if let _borderColor = vStyle.borderColor {
            layer.borderColor = self.borderColor?.CGColor ?? _borderColor.CGColor
        }
        
        if let _borderWidth = vStyle.borderWidth {
            layer.borderWidth = self.borderWidth ?? _borderWidth
        }
        
        if let _cornerRadius = vStyle.cornerRadius {
            layer.cornerRadius = self.cornerRadius ?? _cornerRadius
        }
        
        if let _shadowRadius = vStyle.shadowRadius{
            layer.cornerRadius = self.shadowRadius ?? _shadowRadius
        }
        
        if let _shadowColor = vStyle.shadowColor{
            layer.shadowColor = self.shadowColor?.CGColor ?? _shadowColor.CGColor
        }
        
        
        if let _shadowOpacity = vStyle.shadowOpacity{
            layer.shadowOpacity = self.shadowOpacity ?? _shadowOpacity
        }
        
        if let _shadowOffsetY = vStyle.shadowOffsetY{
            layer.shadowOffset.height = self.shadowOffsetY ?? _shadowOffsetY
        }
    }
    
    public var viewStyle:ViewStyle{
        set{ setViewStyle(newValue) }
        get{ return ViewStyleInstance.none() }
    }
}

// MARK: KVC
public extension CustomView {
    public override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        switch value{
        case let mValue as CGFloat:
            switch key{
            case "borderWidth":
                borderWidth = mValue
            case "cornerRadius":
                cornerRadius = mValue
            case "shadowRadius":
                shadowRadius = mValue
            case "shadowOffsetY":
                shadowOffsetY = mValue
            default:
                var pass = 0
            }
            
        case let mValue as Float:
            switch key{
            case "shadowOpacity":
                shadowOpacity = mValue
            default:
                var pass = 0
            }
            
        default:
            var pass = 0
        }
    }
}
