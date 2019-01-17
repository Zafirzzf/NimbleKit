//
//  ViewController.swift
//  NimbleDemo
//
//  Created by 周正飞 on 2018/9/25.
//  Copyright © 2018年 MIX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "aaaa"

   
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
