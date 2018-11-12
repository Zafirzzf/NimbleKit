//
//  NimbleUI+UIButton.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import Foundation

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
}


/// 快捷方便的为按钮添加事件
private var ButtonTouchKey: Void?
extension UIButton {
    
    typealias TouchedClosure = () -> Void
    /// 快速添加事件
    @discardableResult func touchEvent(closure: @escaping TouchedClosure) -> UIButton {
        objc_setAssociatedObject(self, &ButtonTouchKey, closure, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        self.addTarget(self, action: #selector(touchClick), for: .touchUpInside)
        return self
    }
    
    @objc private func touchClick() {
        if let closure = objc_getAssociatedObject(self,&ButtonTouchKey) as? UIButton.TouchedClosure{
            closure()
        }
    }
}
