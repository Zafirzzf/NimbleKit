//
//  ViewController.swift
//  NimbleKit
//
//  Created by 周正飞 on 2018/9/21.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel = {
        let tmp = UILabel()
        tmp.textColor = .white
        tmp.text = "aaa"
        
        return tmp
    }()
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        // before:
        let editButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        editButton.setTitle("编辑", for: .normal)
        editButton.setTitle("完成", for: .selected)
        editButton.setTitleColor(UIColor.red, for: .normal)
        editButton.setTitleColor(UIColor.brown, for: .selected)
        editButton.backgroundColor = UIColor.red
        editButton.layer.cornerRadius = 10
        
        UIButton()
            .frameRect(0, 0, 50, 50)
            .title("编辑")
            .title("完成", state: .selected)
            .titleColor(UIColor.red)
            .titleColor(UIColor.brown, state: .selected)
            .backgroundColor(UIColor.red)
            .cornerRadius(10)
        let view = UIView()
        view.frame.size.width = 100
        view.frame.size.height = 100
        view.center.x = 150
        view.center.y = 150
        self.view.addSubview(view)
        view.width(100).height(100).centerX(150).centerY(150)
    }
}

