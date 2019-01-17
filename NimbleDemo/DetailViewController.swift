//
//  DetailViewController.swift
//  NimbleDemo
//
//  Created by 周正飞 on 2019/1/17.
//  Copyright © 2019年 MIX. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    deinit {
        print("detail销毁")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "详情"
        UIButton().nb.frameRect(100, 100, 100, 100)
            .backgroundColor(UIColor.red)
            .addToSuperView(self.view)
            .whenTap { [weak self] in
                print(self?.title)
        }
    }
    
}
