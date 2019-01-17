//
//  Nimble+UITextfield.swift
//  NimbleDemo
//
//  Created by 周正飞 on 2019/1/17.
//  Copyright © 2019年 MIX. All rights reserved.
//

import UIKit

private var TextfiledProxyKey: Void?

class TextFieldProxy: NSObject, UITextFieldDelegate {
    
    var shouldBeginEditing: (() -> Bool)?
    var didBeginEditing: (() -> ())?
    var didEndEditing: (() -> ())?
    var shouldReturn: (() -> Bool)?
    var shouldChangeCharReplace: ((_ range: NSRange, _ replace: String) -> Bool)?
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return shouldBeginEditing?() ?? true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditing?()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return shouldReturn?() ?? true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return shouldChangeCharReplace?(range, string) ?? true
    }
}

extension NimbleUI where Type: UITextField {
    var textFieldProxy: TextFieldProxy? {
        get {
            return objc_getAssociatedObject(base, &TextfiledProxyKey) as? TextFieldProxy
        }
        set {
            objc_setAssociatedObject(base, &TextfiledProxyKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @discardableResult
    public func shouldBeginEditing(_ should: @escaping () -> Bool) -> Self {
        if textFieldProxy == nil { textFieldProxy = TextFieldProxy() }
        if base.delegate == nil { base.delegate = textFieldProxy }
        textFieldProxy?.shouldBeginEditing = should
        return self
    }
    
    @discardableResult
    public func didBeginEditing(_ action: @escaping () -> ()) -> Self {
        if textFieldProxy == nil { textFieldProxy = TextFieldProxy() }
        if base.delegate == nil { base.delegate = textFieldProxy }
        textFieldProxy?.didBeginEditing = action
        return self
    }
    
    @discardableResult
    public func didEndEditing(_ action: @escaping () -> ()) -> Self {
        if textFieldProxy == nil { textFieldProxy = TextFieldProxy() }
        if base.delegate == nil { base.delegate = textFieldProxy }
        textFieldProxy?.didEndEditing = action
        return self
    }
    
    @discardableResult
    public func shouldReturn(_ should: @escaping () -> Bool) -> Self {
        if textFieldProxy == nil { textFieldProxy = TextFieldProxy() }
        if base.delegate == nil { base.delegate = textFieldProxy }
        textFieldProxy?.shouldReturn = should
        return self
    }
    
    @discardableResult
    public func shouldChangeCharReplace(_ should: @escaping (NSRange, String) -> Bool) -> Self {
        if textFieldProxy == nil { textFieldProxy = TextFieldProxy() }
        if base.delegate == nil { base.delegate = textFieldProxy }
        textFieldProxy?.shouldChangeCharReplace = should
        return self
    }
    
    @discardableResult
    public func text(_ text: String) -> Self {
        base.text = text
        return self
    }
    
    @discardableResult
    public func font(_ font: UIFont) -> Self {
        base.font = font
        return self
    }
    
    @discardableResult
    public func textAlignment(_ aliment: NSTextAlignment) -> Self {
        base.textAlignment = aliment
        return self
    }
    
    @discardableResult
    public func adjustsFontSize() -> Self {
        base.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    public func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        base.borderStyle = style
        return self
    }
    
    @discardableResult
    public func attributeText(_ text: NSAttributedString) -> Self {
        base.attributedText = text
        return self
    }
    
    @discardableResult
    public func placeholder(_ placeholder: String) -> Self {
        base.placeholder = placeholder
        return self
    }
    
    @discardableResult
    public func attributedPlaceholder(_ holder: NSAttributedString) -> Self {
        base.attributedPlaceholder = holder
        return self
    }
    
    @discardableResult
    public func keyboardType(_ type: UIKeyboardType) -> Self {
        base.keyboardType = type
        return self
    }
    
    @discardableResult
    public func clearButtonMode(_ mode: UITextField.ViewMode) -> Self {
        base.clearButtonMode = mode
        return self
    }
    
    @discardableResult
    public func leftView(_ view: UIView, _ mode: UITextField.ViewMode) -> Self {
        base.leftView = view
        base.leftViewMode = mode
        return self
    }
    
    @discardableResult
    public func rightView(_ view: UIView, _ mode: UITextField.ViewMode) -> Self {
        base.rightView = view
        base.rightViewMode = mode
        return self
    }
    
    @discardableResult
    public func delegate(_ delegate: UITextFieldDelegate) -> Self {
        base.delegate = delegate
        return self
    }
}
