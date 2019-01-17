//
//  NimbleUI+UIButton.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import UIKit

extension NimbleUI where Type: UIButton {
    
    @discardableResult
    public func title(_ normal: String? = nil,
                      _ selected: String? = nil,
                      _ hightlight: String? = nil) -> Self {
        base.setTitle(normal, for: .normal)
        base.setTitle(selected, for: .selected)
        base.setTitle(hightlight, for: .highlighted)
        return self
    }
    
    @discardableResult
    public func title(_ text: String, state: UIControl.State = .normal) -> Self {
        base.setTitle(text, for: state)
        return self
    }
    
    @discardableResult
    public func titleColor(_ normal: UIColor? = nil,
                           _ selected: UIColor? = nil,
                           _ highlight: UIColor? = nil) -> Self {
        base.setTitleColor(normal, for: .normal)
        base.setTitleColor(selected, for: .selected)
        base.setTitleColor(highlight, for: .highlighted)
        return self
    }
    
    @discardableResult
    public func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        base.setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    public func image(_ normal: UIImage? = nil,
                      _ selected: UIImage? = nil,
                      _ hightlight: UIImage? = nil) -> Self {
        base.setImage(normal, for: .normal)
        base.setImage(selected, for: .selected)
        base.setImage(hightlight, for: .highlighted)
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
    
    @discardableResult
    public func font(_ font: UIFont) -> Self {
        base.titleLabel?.font = font
        return self
    }
    
    @discardableResult
    public func target(_ target: Any?,
                       _ action: Selector,
                       _ event: UIControl.Event) -> Self {
        base.addTarget(target, action: action, for: event)
        return self 
    }
    
    @discardableResult
    public func titleEdgeInsets(_ top: CGFloat,
                                _ left: CGFloat,
                                _ bottom: CGFloat,
                                _ right: CGFloat) -> Self {
        base.titleEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    public func imageEdgeInsets(_ top: CGFloat,
                                _ left: CGFloat,
                                _ bottom: CGFloat,
                                _ right: CGFloat) -> Self {
        base.imageEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        return self
    }
    
    @discardableResult
    public func isSelected(_ sel: Bool) -> Self {
        base.isSelected = sel
        return self
    }
    
    var actionProxy: ButtonActionpProxy? {
        get {
            return objc_getAssociatedObject(base, &ButtonTouchKey) as? ButtonActionpProxy
        }
        set {
            objc_setAssociatedObject(base, &ButtonTouchKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    @discardableResult
    public func whenTap(handler: @escaping () -> ()) -> Self {
        actionProxy = ButtonActionpProxy(handler)
        base.addTarget(actionProxy!, action: #selector(actionProxy!.buttonAcction), for: .touchUpInside)
        return self
    }
}

private var ButtonTouchKey: Void?

class ButtonActionpProxy {
    let handler: (() -> ())
    init(_ handler: @escaping () -> ()) {
        self.handler = handler
    }
    
    @objc func buttonAcction() {
        handler()
    }
}
