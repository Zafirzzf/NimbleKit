//
//  Nimble+NavigationItem.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import UIKit

public enum NavigationItemDirection {
    case left
    case right
}

public enum NavigationItemType {
    case text(NSAttributedString)
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
                     type: NavigationItemType,
                     action:  (() -> ())?,
                    size: CGSize = CGSize.zero) -> Self {
        let barItem: UIBarButtonItem
        let itemView: UIView
        switch type {
        case .text(let text):
            itemView = UILabel().nb.size(size).attributeText(text).base
            barItem = UIBarButtonItem(customView: itemView)
        case .image(let image):
            itemView = UIImageView().nb.size(size).image(image).base
            barItem = UIBarButtonItem(customView: itemView)
        }
        itemView.backgroundColor = .red
        itemView.isUserInteractionEnabled = true
        if let action = action {
            itemView.addGestureRecognizer(TapGesture(handler: action))
        }
        switch direction {
        case .left:
            base.leftBarButtonItem = barItem
        case .right:
            base.rightBarButtonItem = barItem
        }
        return self
    }
    
    @discardableResult
    public func item(_ direction: NavigationItemDirection,
                     _ customView: UIView,
                     action: (() -> ())?) -> Self {
        if let action = action {
            customView.addGestureRecognizer(TapGesture(handler: action))
        }
        switch direction {
        case .left:
            base.leftBarButtonItem = UIBarButtonItem(customView: customView)
        case .right:
            base.rightBarButtonItem = UIBarButtonItem(customView: customView)
        }
        return self
    }
}
class TapGesture: UITapGestureRecognizer {
    var tapAction = TapGestureAction()
    init(handler: @escaping () -> ()) {
        tapAction.actionHandler = handler
        super.init(target: tapAction, action: #selector(tapAction.tapAction))
    }
}

class TapGestureAction {
    var actionHandler: (() -> ())?
    @objc func tapAction() {
        actionHandler?()
    }
}
