//
//  ViewController.swift
//  2_url参数
//
//  Created by 刘渊 on 2017/8/6.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    
    private lazy var webV:UIWebView = {
        
        let web = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        web.delegate = self
        web.loadRequest(NSURLRequest(url: NSURL(string: "https://www.dianping.com/shop/500725")! as URL) as URLRequest)
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(webV)
    }
    
    
    //?后是第一个参数
    //&后是后面的参数
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url
        print("url:\(url!)")
        
        //协议 https
        print("scheme:\(url!.scheme)")
        
        //域名  m.dianping.com
        print("host:\(url!.host!)")
        
        
        //https://www.dianping.com/shop/500725 完整的url字符串
        print("absoluteString:\(url!.absoluteString)")
        
        //相对路径  /shop/500725
        print("relativePath:\(url!.relativePath)")
        
        //真机 8080 模拟器nil
        print("port:\(url!.port)")
        
        //路径 /shop/500725
        print("path:\(url?.path)")
        
        //search  "/", "shop", "500725"
        print("\(url?.pathComponents)")
        
        // nil 参数
        print("Query:\(url?.query)")
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\(self.classForCoder)------HelloThere")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

