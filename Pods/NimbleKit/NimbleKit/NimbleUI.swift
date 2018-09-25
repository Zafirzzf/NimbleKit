//
//  NimbleKit.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/9/21.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit
protocol NimbleCompatible {
    associatedtype Compatible
    var nb: Compatible { get }
}
extension UIView: NimbleCompatible {}

extension NimbleCompatible {
    var nb: NimbleUI<Self> {
        return NimbleUI(self)
    }
}

final class NimbleUI<Type> {
    let base: Type
    init(_ type: Type) {
        self.base = type
    }
}

//MARK: Size And Origin
extension NimbleUI where Type: UIView {
    @discardableResult
    func frameRect(_ x: CGFloat,
                                  _ y: CGFloat,
                                  _ width: CGFloat,
                                  _ height: CGFloat) -> Type {
        base.frame = CGRect(x: x, y: y, width: width, height: height)
        return base
    }
    
    func originX(_ x: CGFloat) -> Type {
        base.frame.origin.x = x
        return base
    }
    
    func originY(_ y: CGFloat) -> Type {
        base.frame.origin.y = y
        return base
    }
    
    func width(_ width: CGFloat) -> Type {
        base.frame.size.width = width
        return base
    }
    
    func height(_ height: CGFloat) -> Type {
        base.frame.size.height = height
        return base
    }
    
    func centerX(_ value: CGFloat) -> Type {
        base.center.x = value
        return base
    }
    
    func centerY(_ value: CGFloat) -> Type {
        base.center.y = value
        return base
    }
}

// MARK: - View State
extension NimbleUI where Type: UIView {
    
    func backgroundColor(_ color: UIColor) -> Type {
        base.backgroundColor = color
        return base
    }
    
    func tintColor(_ color: UIColor) -> Type {
        base.tintColor = color
        return base
    }
    
    func hidden(_ isHidden: Bool) -> Type {
        base.isHidden = isHidden
        return base
    }
    
    func alpha(_ alpha: CGFloat) -> Type {
        base.alpha = alpha
        return base
    }
    
    func clipsToBounds(_ clips: Bool) -> Type {
        base.clipsToBounds = clips
        return base
    }
    
    func cornerRadius(_ number: CGFloat) -> Type {
        base.layer.cornerRadius = number
        return base
    }
}

// MARK: UILabel
extension NimbleUI where Type: UILabel {
    
    @discardableResult
        func text(_ text: String) -> Type {
        base.text = text
        return base
    }
    
    func textColor(_ color: UIColor) -> UILabel {
        base.textColor = color
        return base
    }
    
    func font(_ font: UIFont) -> UILabel {
        base.font = font
        return base
    }
    
    func textAlignment(_ type: NSTextAlignment) -> UILabel {
        base.textAlignment = type
        return base
    }
    
    func attributeText(_ text: NSAttributedString) -> UILabel {
        base.attributedText = text
        return base
    }
    
    func numberOfLines(_ number: Int) -> UILabel {
        base.numberOfLines = number
        return base
    }
    
    func adjustFontSize(_ adjust: Bool) -> UILabel {
        base.adjustsFontSizeToFitWidth = adjust
        return base
    }
}

// MARK: UIButton
extension NimbleUI where Type: UIButton {
    @discardableResult
    func title(_ text: String, state: UIControl.State = .normal) -> UIButton {
        base.setTitle(text, for: state)
        return base
    }
    
    func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> UIButton {
        base.setTitleColor(color, for: .normal)
        return base
    }
    
    func font(_ font: UIFont) -> UIButton {
        base.titleLabel?.font = font
        return base
    }
    
    func image(_ image: UIImage, state: UIControl.State = .normal) -> UIButton {
        base.setImage(image, for: state)
        return base
    }
    
    func backgroundImage(_ image: UIImage, state: UIControl.State = .normal) -> UIButton {
        base.setBackgroundImage(image, for: state)
        return base
    }
}

// MARK: - UIImageView
extension NimbleUI where Type: UIImageView {
    @discardableResult func image(_ image: UIImage) -> UIImageView {
        base.image = image
        return base
    }
    
    @discardableResult func highlightImage(_ image: UIImage) -> UIImageView {
        base.highlightedImage = image
        return base
    }
}

// MARK: - UITableView
extension NimbleUI where Type: UITableView {
    @discardableResult
    func dataSource(_ target: UITableViewDataSource) -> Type {
        base.dataSource = target
        return base
    }
    
    func delegate(_ target: UITableViewDelegate) -> Type {
        base.delegate = target
        return base
    }
    
    func rowHeight(_ height: CGFloat) -> Type {
        base.rowHeight = height
        return base
    }
    
    func estimatedRowHeight(_ height: CGFloat) -> Type {
        base.estimatedRowHeight = height
        return base
    }
}

extension NimbleUI where Type: UITextField {
    @discardableResult func title(_ text: String) -> UITextField {
        base.text = text
        return base
    }
}

extension NimbleUI where Type: UITextView {
    @discardableResult func title(_ text: String) -> UITextView {
        base.text = text
        return base
    }
}


