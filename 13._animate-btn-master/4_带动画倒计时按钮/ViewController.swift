//
//  ViewController.swift
//  5.带动画倒计时按钮
//
//  Created by 刘渊 on 2017/7/5.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = LYButton(count: 5, frame: CGRect(x: 50,y: 100,width: 100,height: 50), color: nil)
        btn.animaType = CountBtnType.LYBtnTypeScale
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        self.view.addSubview(btn)
    
        let btn2 = LYButton(count: 5, frame: CGRect(x: 200,y: 100,width: 100, height: 50), color: UIColor.cyan)
        btn2.enalbe_bgColor = UIColor.green
        btn2.animaType = CountBtnType.LYBtnTypeRotate
        btn2.layer.masksToBounds = true
        btn2.layer.cornerRadius = 5
        self.view.addSubview(btn2)
        
        
        
        
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

