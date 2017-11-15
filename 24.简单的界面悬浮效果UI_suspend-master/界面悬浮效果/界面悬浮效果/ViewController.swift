//
//  ViewController.swift
//  界面悬浮效果
//
//  Created by 刘渊 on 2017/8/16.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let kAnimationInterval:TimeInterval = 0.25
    static let kWidth = 65
    static let ScreenWidth = UIScreen.main.bounds.size.width
    static let ScreenHeight = UIScreen.main.bounds.size.height
    
    private lazy var tableV:UITableView = {
       let tab = UITableView(frame: CGRect.zero, style: .plain)

        tab.rowHeight = 80
        tab.backgroundColor = UIColor.red
        
        return tab
    }()
    
    fileprivate var disPlayV:UIView = {
        
        let disPV = UIView(frame: CGRect(x: ScreenWidth - CGFloat(kWidth), y: ScreenHeight/3 * 2.0, width: 60, height: 60))
        disPV.backgroundColor = UIColor.brown
        
        let lab = UILabel()
        lab.text = "致粉丝_爱你"
        lab.textColor = UIColor.orange
        lab.textAlignment = NSTextAlignment.center
        lab.font = UIFont.systemFont(ofSize: 12)
        lab.numberOfLines = 0
        
        disPV.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.leading.equalTo(3)
            make.trailing.equalTo(-3)
            make.top.equalTo(5)
        })
        
        
        return disPV
    }()
    
    
    
    func tap_Action(){
        
        print("123")
        let jianshu = JianShuViewController()
        jianshu.urlStr = "http://www.jianshu.com"
        self.navigationController?.pushViewController(jianshu, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        
        view.backgroundColor = UIColor.white
        self.title = "金融"
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        self.tableV.delegate = self
        self.tableV.dataSource = self
        
        self.view.addSubview(self.tableV)
        self.tableV.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        self.view.addSubview(disPlayV)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap_Action))
        disPlayV.addGestureRecognizer(tap)

        
    }
}

extension ViewController{
    
    //开始拖拽的时候隐藏悬浮框
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            UIView.animate(withDuration: kAnimationInterval) { 
                self.disPlayV.frame = CGRect(x: ViewController.ScreenWidth, y: ViewController.ScreenHeight/3 * 2.0, width: 60, height: 60)
        }
    }
    
    //结束拖拽,悬浮窗口恢复
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if decelerate == false {
            UIView.animate(withDuration: kAnimationInterval, animations: { 
                self.disPlayV.frame = CGRect(x: ViewController.ScreenWidth - CGFloat(ViewController.kWidth), y: ViewController.ScreenHeight/3 * 2.0, width: 60, height: 60)
            })
        }
        
        print("------")
    }
    
    //快速滑动,减速后,响应此代理
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: kAnimationInterval) { 
            self.disPlayV.frame = CGRect(x: ViewController.ScreenWidth - CGFloat(ViewController.kWidth), y: ViewController.ScreenHeight/3 * 2.0, width: 60, height: 60)
        }
        print("======")
    }
    
}


extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
            cell?.selectionStyle = .none
        }
        
        cell?.textLabel?.text = "text"
        cell?.detailTextLabel?.text = "detail"
        return cell!
    }
    
}

