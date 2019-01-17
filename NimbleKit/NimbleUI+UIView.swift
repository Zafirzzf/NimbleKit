//
//  NimbleUI+UIView.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import UIKit

//MARK: Size And Origin
extension NimbleUI where Type: UIView {
    @discardableResult
    public func frameRect(_ x: CGFloat,
                          _ y: CGFloat,
                          _ width: CGFloat,
                          _ height: CGFloat) -> Self {
        base.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
    
    @discardableResult
    public func originX(_ x: CGFloat) -> Self {
        base.frame.origin.x = x
        return self
    }
    
    @discardableResult
    public func originY(_ y: CGFloat) -> Self {
        base.frame.origin.y = y
        return self
    }
    
    @discardableResult
    public func width(_ width: CGFloat) -> Self {
        base.frame.size.width = width
        return self
    }
    
    @discardableResult
    public func height(_ height: CGFloat) -> Self {
        base.frame.size.height = height
        return self
    }
    
    @discardableResult
    public func size(_ size: CGFloat) -> Self {
        return width(size).height(size)
    }
    
    @discardableResult
    public func size(_ size: CGSize) -> Self {
        return width(size.width).height(size.height)
    }
    
    @discardableResult
    public func centerX(_ value: CGFloat) -> Self {
        base.center.x = value
        return self
    }
    
    @discardableResult
    public func centerY(_ value: CGFloat) -> Self {
        base.center.y = value
        return self
    }
    
    @discardableResult
    public func center(_ value: CGPoint) -> Self {
        base.center = value
        return self
    }
}

// MARK: - View State
extension NimbleUI where Type: UIView {
    @discardableResult
    public func backgroundColor(_ color: UIColor) -> Self {
        base.backgroundColor = color
        return self
    }
    
    @discardableResult
    public func tintColor(_ color: UIColor) -> Self {
        base.tintColor = color
        return self
    }
    
    @discardableResult
    public func hidden(_ isHidden: Bool) -> Self {
        base.isHidden = isHidden
        return self
    }
    
    @discardableResult
    public func alpha(_ alpha: CGFloat) -> Self {
        base.alpha = alpha
        return self
    }
    
    @discardableResult
    public func clipsToBounds(_ clips: Bool) -> Self {
        base.clipsToBounds = clips
        return self
    }
    
    @discardableResult
    public func maskToBounds() -> Self {
        base.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    public func cornerRadius(_ number: CGFloat) -> Self {
        base.layer.cornerRadius = number
        return self
    }
    
    @discardableResult
    public func contentMode(_ mode: UIView.ContentMode) -> Self {
        base.contentMode = mode
        return self
    }
    
    @discardableResult
    public func addToSuperView(_ view: UIView) -> Self {
        view.addSubview(base)
        return self
    }
    
    @discardableResult
    public func border(width: CGFloat,
                       color: UIColor) -> Self {
        base.layer.borderColor = color.cgColor
        base.layer.borderWidth = width
        return self
    }
    
    @discardableResult
    public func shadow(color: UIColor?,
                       opacity: Float?,
                       offset: CGSize?,
                       radius: CGFloat?) -> Self {
        base.layer.shadowColor = color?.cgColor
        if let opacity = opacity {
            base.layer.shadowOpacity = opacity
        }
        if let offset = offset {
            base.layer.shadowOffset = offset
        }
        if let radius = radius {
            base.layer.shadowRadius = radius
        }
        return self 
    }
}
