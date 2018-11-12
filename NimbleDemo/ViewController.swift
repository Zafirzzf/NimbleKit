//
//  ViewController.swift
//  NimbleDemo
//
//  Created by 周正飞 on 2018/9/25.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit
import NimbleKit
class ViewController: UIViewController {
    
    let label = UILabel().nb.textColor(.white).text("aaa").base
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let editButton = UIButton().nb
            .frameRect(0, 0, 50, 50)
            .title("编辑")
            .title("完成", state: .selected)
            .titleColor(UIColor.red)
            .titleColor(UIColor.brown, state: .selected)
            .backgroundColor(UIColor.red)            
            .cornerRadius(10).base
        let view = UIView()
        view.nb.width(100).height(100).centerX(150).centerY(150).base

    }
}

