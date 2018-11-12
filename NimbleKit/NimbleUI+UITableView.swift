//
//  NimbleUI+UITableView.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import Foundation

extension NimbleUI where Type: UITableView {
    @discardableResult
    public func dataSource(_ target: UITableViewDataSource) -> Self {
        base.dataSource = target
        return self
    }
    
    @discardableResult
    public func delegate(_ target: UITableViewDelegate) -> Self {
        base.delegate = target
        return self
    }
    
    @discardableResult
    public func rowHeight(_ height: CGFloat) -> Self {
        base.rowHeight = height
        return self
    }
    
    @discardableResult
    public func estimatedRowHeight(_ height: CGFloat) -> Self {
        base.estimatedRowHeight = height
        return self
    }
    
    @discardableResult
    public func separator(style: UITableViewCell.SeparatorStyle,
                          color: UIColor? = nil) -> Self {
        base.separatorStyle = style
        base.separatorColor = color
        return self
    }
    
    @discardableResult
    public func tableHeaderView(_ view: UIView) -> Self {
        base.tableHeaderView = view
        return self
    }
    
    @discardableResult
    public func tableFooterView(_ view: UIView) -> Self {
        base.tableFooterView = view
        return self
    }
}
