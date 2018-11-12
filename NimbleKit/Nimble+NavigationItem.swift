//
//  Nimble+NavigationItem.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import Foundation
public enum NavigationItemDirection {
    case left
    case right
}
public enum NavigationItemStyle {
    case text(String)
    case image(UIImage)
}


extension NimbleUI where Type: UINavigationItem {
 
    @discardableResult
    public func title(_ title: String) -> Self {
        base.title = title
        return self
    }
    
    @discardableResult
    public func item(_ direction: NavigationItemDirection,
                     _ style: NavigationItemStyle,
                     _ action: @escaping () -> ()) -> Self {
        var barItem: UIBarButtonItem
        switch style {
        case .text(let text):
            barItem = UIBarButtonItem.create(title: text, action: action)
        case .image(let image):
            barItem = UIBarButtonItem.create(image: image, action: action)
        }
        switch direction {
        case .left:
            base.leftBarButtonItem = barItem
        case .right:
            base.rightBarButtonItem = barItem
        }
        return self
    }
}
/// 快捷方便的为按钮添加事件
private var BarItemActionKey: Void?
extension UIBarButtonItem {
    
     typealias TouchedClosure = () -> Void
    /// 快速添加事件
    static func create(title: String,
                            action: @escaping TouchedClosure) -> UIBarButtonItem {
        objc_setAssociatedObject(self, &BarItemActionKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return self.init(title: title, style: .plain, target: self, action: #selector(touchClick))
    }
    
    static func create(image: UIImage,
                     action: @escaping TouchedClosure) -> UIBarButtonItem {
        objc_setAssociatedObject(self, &BarItemActionKey, action, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        return self.init(image: image, style: .plain, target: self, action: #selector(touchClick))
    }
    
    @objc private func touchClick() {
        if let closure = objc_getAssociatedObject(self,&BarItemActionKey) as? UIBarButtonItem.TouchedClosure {
            closure()
        }
    }
}
