//
//  NimbleUI+UILabel.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import UIKit

extension NimbleUI where Type: UILabel {
    
    @discardableResult
    public func text(_ text: String) -> Self {
        base.text = text
        return self
    }
    
    @discardableResult
    public func attributeText(_ text: NSAttributedString) -> Self {
        base.attributedText = text
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
    public func numberOfLines(_ number: Int) -> Self {
        base.numberOfLines = number
        return self
    }
    
    @discardableResult
    public func adjustFontSize() -> Self {
        base.adjustsFontSizeToFitWidth = true
        return self
    }
}
