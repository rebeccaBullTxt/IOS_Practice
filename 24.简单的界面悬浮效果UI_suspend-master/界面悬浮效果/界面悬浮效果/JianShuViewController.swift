//
//  JianShuViewController.swift
//  界面悬浮效果
//
//  Created by 刘渊 on 2017/8/16.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit

class JianShuViewController: UIViewController {

    var urlStr:String?
    var js_webV:UIWebView = {
       
        let web = UIWebView()
        web.backgroundColor = UIColor.cyan
        web.scalesPageToFit = true
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.title = "简书"
        self.view.addSubview(js_webV)
        
        
        js_webV.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        let url = NSURL(string: self.urlStr!) as! NSURL
        let request = NSURLRequest(url: url as URL)
        self.js_webV.loadRequest(request as URLRequest)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
