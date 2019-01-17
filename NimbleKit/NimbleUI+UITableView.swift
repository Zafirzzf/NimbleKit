//
//  NimbleUI+UITableView.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/11/12.
//

import UIKit

private var TableProxyKey: Void?

class TableViewProxy: NSObject, UITableViewDelegate {

    var sectionHeaderHeightOfIndex: ((Int) -> CGFloat)?
    var sectionHeaderViewOfIndex: ((Int) -> UIView?)?
    var sectionFooterHeightOfIndex: ((Int) -> CGFloat)?
    var sectionFooterViewOfIndex: ((Int) -> UIView?)?
    var rowHeightOfIndex: ((IndexPath) -> CGFloat)?
    var didSelectRow: ((IndexPath) -> ())?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRow?(indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeaderViewOfIndex?(section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeightOfIndex?(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sectionFooterViewOfIndex?(section)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sectionFooterHeightOfIndex?(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  rowHeightOfIndex?(indexPath) ?? 44
    }
}

extension NimbleUI where Type: UITableView {
    
    var tableProxy: TableViewProxy? {
        get {
            return objc_getAssociatedObject(base, &TableProxyKey) as? TableViewProxy
        }
        set {
            objc_setAssociatedObject(base, &TableProxyKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: TableView代理相关
    @discardableResult
    public func sectionHeaderHeight(_ section: @escaping (Int) -> CGFloat) -> Self {
        if tableProxy == nil { tableProxy = TableViewProxy() }
        if base.delegate == nil { base.delegate = tableProxy }
        tableProxy?.sectionHeaderHeightOfIndex = section
        return self
    }
    
    @discardableResult
    public func sectionHeaderView(_ section: @escaping (Int) -> UIView?) -> Self {
        if tableProxy == nil { tableProxy = TableViewProxy() }
        if base.delegate == nil { base.delegate = tableProxy }
        tableProxy?.sectionHeaderViewOfIndex = section
        return self
    }
    
    @discardableResult
    public func sectionFooterHeight(_ section: @escaping (Int) -> CGFloat) -> Self {
        if tableProxy == nil { tableProxy = TableViewProxy() }
        if base.delegate == nil { base.delegate = tableProxy }
        tableProxy?.sectionFooterHeightOfIndex = section
        return self
    }
    
    @discardableResult
    public func sectionFooterView(_ section: @escaping (Int) -> UIView?) -> Self {
        if tableProxy == nil { tableProxy = TableViewProxy() }
        if base.delegate == nil { base.delegate = tableProxy }
        tableProxy?.sectionFooterViewOfIndex = section
        return self
    }
    
    @discardableResult
    public func rowHeightOf(_ indexPath: @escaping (IndexPath) -> CGFloat) -> Self {
        if tableProxy == nil { tableProxy = TableViewProxy() }
        if base.delegate == nil { base.delegate = tableProxy }
        tableProxy?.rowHeightOfIndex = indexPath
        return self
    }
    
    @discardableResult
    public func didSelect(_ row: @escaping (IndexPath) -> ()) -> Self {
        if tableProxy == nil { tableProxy = TableViewProxy() }
        if base.delegate == nil { base.delegate = tableProxy }
        tableProxy?.didSelectRow = row
        return self
    }
    
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
    public func separatorInset(_ inset: UIEdgeInsets) -> Self {
        base.separatorInset = inset
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
    
    @discardableResult
    public func register(_ cellClass: AnyClass?, cellIdentifier: String) -> Self {
        base.register(cellClass, forCellReuseIdentifier: cellIdentifier)
        return self
    }
    
    @discardableResult
    public func register(_ nib: UINib?, cellIdentifier: String) -> Self {
        base.register(nib, forCellReuseIdentifier: cellIdentifier)
        return self
    }
}

