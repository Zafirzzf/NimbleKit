//
//  NimbleKit.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/9/21.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit
public protocol NimbleCompatible {
    associatedtype Compatible
    var nb: Compatible { get }
}
extension UIView: NimbleCompatible {}

extension NimbleCompatible {
    public var nb: NimbleUI<Self> {
        return NimbleUI(self)
    }
}

public final class NimbleUI<Type> {
    public let base: Type
    public init(_ type: Type) {
        self.base = type
    }
}

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
    public func centerX(_ value: CGFloat) -> Self {
        base.center.x = value
        return self
    }
    
    @discardableResult
    public func centerY(_ value: CGFloat) -> Self {
        base.center.y = value
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
    public func cornerRadius(_ number: CGFloat) -> Self {
        base.layer.cornerRadius = number
        return self
    }
}

// MARK: UILabel
extension NimbleUI where Type: UILabel {
    
    @discardableResult
        public func text(_ text: String) -> Self {
        base.text = text
        return self
    }
    
    @discardableResult
    public func textColor(_ color: UIColor) -> Self {
        base.textColor = color
        return self
    }
    
    @discardableResult
    public func font(_ font: UIFont) -> Self {
        base.font = font
        return self
    }
    
    @discardableResult
    public func textAlignment(_ type: NSTextAlignment) -> Self {
        base.textAlignment = type
        return self
    }
    
    @discardableResult
    public func attributeText(_ text: NSAttributedString) -> Self {
        base.attributedText = text
        return self
    }
    
    @discardableResult
    public func numberOfLines(_ number: Int) -> Self {
        base.numberOfLines = number
        return self
    }
    
    @discardableResult
    public func adjustFontSize(_ adjust: Bool) -> Self {
        base.adjustsFontSizeToFitWidth = adjust
        return self
    }
}

// MARK: UIButton
extension NimbleUI where Type: UIButton {
    @discardableResult
    public func title(_ text: String, state: UIControl.State = .normal) -> Self {
        base.setTitle(text, for: state)
        return self
    }
    
    @discardableResult
    public func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        base.setTitleColor(color, for: .normal)
        return self
    }
    
    @discardableResult
    public func font(_ font: UIFont) -> Self {
        base.titleLabel?.font = font
        return self
    }
    
    @discardableResult
    public func image(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        base.setImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func backgroundImage(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        base.setBackgroundImage(image, for: state)
        return self
    }
}

// MARK: - UIImageView
extension NimbleUI where Type: UIImageView {
    @discardableResult
    public func image(_ image: UIImage) -> Self {
        base.image = image
        return self
    }
    
    @discardableResult
    public func highlightImage(_ image: UIImage) -> Self {
        base.highlightedImage = image
        return self
    }
}

// MARK: - UITableView
extension NimbleUI where Type: UITableView {
    @discardableResult
    public func dataSource(_ target: UITableViewDataSource) -> Self {
        base.dataSource = target
        return self
    }
    
    @discardableResult
    public func delegate(_ target: UITableViewDelegate) -> Self {
        base.delegate = target
        return self
    }
    
    @discardableResult
    public func rowHeight(_ height: CGFloat) -> Self {
        base.rowHeight = height
        return self
    }
    
    @discardableResult
    public func estimatedRowHeight(_ height: CGFloat) -> Self {
        base.estimatedRowHeight = height
        return self
    }
}

extension NimbleUI where Type: UITextField {
    @discardableResult
    public func title(_ text: String) -> Self {
        base.text = text
        return self
    }
}

extension NimbleUI where Type: UITextView {
    @discardableResult
    public func title(_ text: String) -> Self {
        base.text = text
        return self
    }
}


