//
//  NimbleKit.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/9/21.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit

protocol NimbleUI where Self: UIView {}
extension UIView: NimbleUI {}

//MARK: Size And Origin
extension NimbleUI {
    @discardableResult func frameRect(_ x: CGFloat,
                                  _ y: CGFloat,
                                  _ width: CGFloat,
                                  _ height: CGFloat) -> Self {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }
    
    @discardableResult func originX(_ x: CGFloat) -> Self {
        self.frame.origin.x = x
        return self
    }
    
    @discardableResult func originY(_ y: CGFloat) -> Self {
        self.frame.origin.y = y
        return self
    }
    
    @discardableResult func width(_ width: CGFloat) -> Self {
        self.frame.size.width = width
        return self
    }
    
    @discardableResult func height(_ height: CGFloat) -> Self {
        self.frame.size.height = height
        return self
    }
    
    @discardableResult func centerX(_ value: CGFloat) -> Self {
        self.center.x = value
        return self
    }
    
    @discardableResult func centerY(_ value: CGFloat) -> Self {
        self.center.y = value
        return self
    }
}

// MARK: - View State
extension NimbleUI {
    
    @discardableResult func backgroundColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult func tintColor(_ color: UIColor) -> Self {
        self.tintColor = color
        return self
    }
    
    @discardableResult func hidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @discardableResult func clipsToBounds(_ clips: Bool) -> Self {
        self.clipsToBounds = clips
        return self
    }
    
    @discardableResult func cornerRadius(_ number: CGFloat) -> Self {
        self.layer.cornerRadius = number
        return self
    }
}

// MARK: UILabel
extension NimbleUI where Self: UILabel {
    @discardableResult func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult func textAlignment(_ type: NSTextAlignment) -> Self {
        self.textAlignment = type
        return self
    }
    
    @discardableResult func attributeText(_ text: NSAttributedString) -> Self {
        self.attributedText = text
        return self
    }
    
    @discardableResult func numberOfLines(_ number: Int) -> Self {
        self.numberOfLines = number
        return self
    }
    
    @discardableResult func adjustFontSize(_ adjust: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjust
        return self
    }
}

// MARK: UIButton
extension NimbleUI where Self: UIButton {
    @discardableResult func title(_ text: String, state: UIControl.State = .normal) -> Self {
        self.setTitle(text, for: state)
        return self
    }
    
    @discardableResult func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: .normal)
        return self
    }
    
    @discardableResult func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    
    @discardableResult func image(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    @discardableResult func backgroundImage(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
}

// MARK: - UIImageView
extension NimbleUI where Self: UIImageView {
    @discardableResult func image(_ image: UIImage) -> Self {
        self.image = image
        return self
    }
    
    @discardableResult func highlightImage(_ image: UIImage) -> Self {
        self.highlightedImage = image
        return self
    }
}

// MARK: - UITableView
extension NimbleUI where Self: UITableView {
    @discardableResult func dataSource(_ target: UITableViewDataSource) -> Self {
        self.dataSource = target
        return self
    }
    
    @discardableResult func delegate(_ target: UITableViewDelegate) -> Self {
        self.delegate = target
        return self
    }
    
    @discardableResult func rowHeight(_ height: CGFloat) -> Self {
        self.rowHeight = height
        return self
    }
    
    @discardableResult func estimatedRowHeight(_ height: CGFloat) -> Self {
        self.estimatedRowHeight = height
        return self
    }
}

extension NimbleUI where Self: UITextField {
    @discardableResult func title(_ text: String) -> Self {
        self.text = text
        return self
    }
}

extension NimbleUI where Self: UITextView {
    @discardableResult func title(_ text: String) -> Self {
        self.text = text
        return self
    }
}


