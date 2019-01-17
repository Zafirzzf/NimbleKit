//
//  Nimble+UIImageView.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import UIKit

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
