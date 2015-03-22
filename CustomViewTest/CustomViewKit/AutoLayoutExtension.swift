//
//  AutoLayoutExtension.swift
//  CustomViewTest
//
//  Created by Yume on 2015/3/14.
//  Copyright (c) 2015年 yume. All rights reserved.
//

import UIKit

public struct LayoutAttribute {
    var view:UIView?
    var attribute:NSLayoutAttribute
    var multiplier:CGFloat
    var constant:CGFloat
    
    init(view:UIView, attribute: NSLayoutAttribute, constant:CGFloat = 0, multiplier:CGFloat = 1.0){
        self.view = view;
        self.attribute = attribute
        self.multiplier = multiplier
        self.constant = constant;
    }
    
}

public extension UIView {
    
    func addConstraints (constraints: NSLayoutConstraint...){
        for constraint in constraints {
            self.addConstraint(constraint)
        }
    }
    
    public var width : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .Width); }
    }
    
    public var height : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .Height); }
    }
    
    public var leading : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .Leading); }
    }
    
    public var trailing : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .Trailing); }
    }
    
    public var top : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .Top); }
    }
    
    public var bottom : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .Bottom); }
    }
    
    public var centerX : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .CenterX); }
    }
    
    public var centerY : LayoutAttribute {
        get { return LayoutAttribute(view: self, attribute : .CenterY); }
    }
    
}

func == (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    var layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.Equal, toItem: right.view,
        attribute: right.attribute, multiplier: right.multiplier, constant: right.constant)
    
    return layoutConstraint
}

func >= (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    var layoutConstraint = NSLayoutConstraint(item: left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: right.view, attribute: right.attribute,
        multiplier: right.multiplier, constant: right.constant);
    return layoutConstraint
}

func <= (left: LayoutAttribute, right: LayoutAttribute) -> NSLayoutConstraint {
    var layoutConstraint = NSLayoutConstraint(item: left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: right.view, attribute: right.attribute,
        multiplier: right.multiplier, constant: right.constant);
    return layoutConstraint
}

func == (left: LayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    var layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.Equal, toItem: nil,
        attribute: .NotAnAttribute, multiplier: 1.0, constant: right)
    
    return layoutConstraint
}

func <= (left: LayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    var layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.LessThanOrEqual, toItem: nil,
        attribute: .NotAnAttribute, multiplier: 1.0, constant: right)
    
    return layoutConstraint
}

func >= (left: LayoutAttribute, right: CGFloat) -> NSLayoutConstraint {
    var layoutConstraint = NSLayoutConstraint(item:left.view!,
        attribute: left.attribute, relatedBy: NSLayoutRelation.GreaterThanOrEqual, toItem: nil,
        attribute: .NotAnAttribute, multiplier: 1.0, constant: right)
    
    return layoutConstraint
}

// ------------------------------------------

infix operator *+ {
    associativity left
    precedence 150
}

func *+(left: LayoutAttribute, right: (multiplier:CGFloat, contant:CGFloat)) -> LayoutAttribute {
    var layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: right.contant, multiplier:right.multiplier)
    return layoutAttribute
}

func *(left: LayoutAttribute, right: CGFloat) -> LayoutAttribute {
    var layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: 0, multiplier:right)
    return layoutAttribute
}

func +(left: LayoutAttribute, right: CGFloat) -> LayoutAttribute {
    var layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: right, multiplier:left.multiplier)
    return layoutAttribute
}

func -(left: LayoutAttribute, right: CGFloat) -> LayoutAttribute {
    var layoutAttribute = LayoutAttribute(view:left.view!, attribute: left.attribute, constant: -right, multiplier:left.multiplier)
    return layoutAttribute
}

infix operator <~ {
    associativity left
    precedence 125
}

func <~ (left: NSLayoutConstraint, right: UILayoutPriority) -> NSLayoutConstraint {
    left.priority = right
    return left
}

infix operator <- {
    associativity right
    precedence 90
}

func <- (left: UIView, right: NSLayoutConstraint) -> UIView {
    left.addConstraint(right)
    return left
}
