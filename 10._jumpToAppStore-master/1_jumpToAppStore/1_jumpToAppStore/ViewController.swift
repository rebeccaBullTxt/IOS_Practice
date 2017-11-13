//
//  ViewController.swift
//  1_jumpToAppStore
//
//  Created by 刘渊 on 2017/8/6.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let alertController = UIAlertController(title: "觉得好用,给个评价", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "暂不评价", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default) { (action) in
            self.goToAppStore()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func goToAppStore(){
        
        let urlString = "itms-apps://itunes.apple.com/app/id444934666"
        let url = NSURL(string: urlString)
        UIApplication.shared.openURL(url! as URL)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
