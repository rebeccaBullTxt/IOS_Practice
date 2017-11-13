//
//  ViewController.swift
//  网络2
//
//  Created by 刘渊 on 2017/9/16.
//  Copyright © 2017年 LiuYuan. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let (success,ssid,bssid) = getSSID()
        print(success,ssid,bssid);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //获取当前WIFI网络连接
    func getSSID()->(success:Bool,ssid:String,bssid:String)
    {
        
        if let cfa:NSArray = CNCopySupportedInterfaces()
        {
            for x in cfa
            {
                if let dict = CFBridgingRetain(CNCopyCurrentNetworkInfo(x as! CFString))
                {
                    let ssid = dict["SSID"]!
                    let bssid = dict["BSSID"]!
                    
                    print("ssid = \(String(describing: ssid)), bssid = \(String(describing: bssid))");
                    return (true,ssid as! String,bssid as! String)
                }
            }
        }
        return (false,"","")
    }
}

