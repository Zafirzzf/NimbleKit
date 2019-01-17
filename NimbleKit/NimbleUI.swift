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
extension UINavigationItem: NimbleCompatible {}

extension NimbleCompatible {
    public var nb: NimbleUI<Self> {
        return NimbleUI(self)
    }
}

public final class NimbleUI<Type: NimbleCompatible> {
    public let base: Type
    public init(_ type: Type) {
        self.base = type
    }
}


extension NimbleUI where Type: UITextView {
    @discardableResult
    public func title(_ text: String) -> Self {
        base.text = text
        return self
    }
}


