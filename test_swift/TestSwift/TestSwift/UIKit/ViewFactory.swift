//
//  ViewFactory.swift
//  TestSwift
//
//  Created by 刘渊 on 2018/3/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

import UIKit

class ViewFactory {

    /// 控件默认尺寸
    ///
    /// - Returns:
    class func getDefaultFrame() -> CGRect {
        
        let defaultFrame = CGRect(x: 0, y: 0, width: 100, height: 30);
        return defaultFrame;
    }
    
    
    /// 创建控件方法,可扩展
    ///
    /// - Parameters:
    ///   - type: <#type description#>
    ///   - title: <#title description#>
    ///   - action: <#action description#>
    ///   - sender: <#sender description#>
    /// - Returns: <#return value description#>
    class func createControl(type:String, title:[String], action:Selector, sender:AnyObject) -> UIView {
        
        switch type {
        case "label":
            return ViewFactory.createLable(title: title[0])
        case "button":
            return ViewFactory.createButton(title: title[0], action: action, sender: sender as! UIViewController)
        case "text":
            return ViewFactory.createTextField(value: title[0], action: action, sender: sender as! UITextFieldDelegate)
        case "segment":
            return ViewFactory.createSegment(items: title, action: action, sender: sender as! UIViewController)
        default:
            return ViewFactory.createLable(title: title[0])
        }
    }
    
    ///
    ///
    /// - Parameter title: <#title description#>
    /// - Returns: <#return value description#>
    class func createLable(title:String) -> UILabel{
        let label = UILabel()
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.text = title
        label.frame = ViewFactory.getDefaultFrame()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return label
    }
    
    /// 创建按钮控件
    ///
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - action: <#action description#>
    ///   - sender: <#sender description#>
    /// - Returns: <#return value description#>
    class func createButton(title:String, action:Selector, sender: UIViewController) -> UIButton {
        
        let button = UIButton(frame: ViewFactory.getDefaultFrame())
        button.backgroundColor = UIColor.orange
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(sender, action: action, for: .touchUpInside)
        return button;
    }
    
    /// 创建文本输入框
    ///
    /// - Parameters:
    ///   - value: <#value description#>
    ///   - action: <#action description#>
    ///   - sender: <#sender description#>
    /// - Returns: <#return value description#>
    class func createTextField(value:String, action:Selector, sender:UITextFieldDelegate) -> UITextField {
        
        let textField = UITextField(frame: ViewFactory.getDefaultFrame())
        textField.backgroundColor = UIColor.clear
        textField.textColor = UIColor.black
        textField.text = value
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.adjustsFontSizeToFitWidth = true
        textField.delegate = sender
        return textField;
    }
    
    /// 创建分段单选控件
    ///
    /// - Parameters:
    ///   - items: <#items description#>
    ///   - action: <#action description#>
    ///   - sender: <#sender description#>
    /// - Returns: <#return value description#>
    class func createSegment(items:[String], action:Selector, sender:UIViewController) -> UISegmentedControl {
        
        let segment = UISegmentedControl(items: items)
        segment.frame = ViewFactory.getDefaultFrame()
        segment.selectedSegmentIndex = 0
        segment.isMomentary = false
        segment.addTarget(sender, action: action, for: UIControlEvents.valueChanged)
        return segment
    }
}

extension UIButton {
    
    convenience init(imageName: String? = nil, backgroundImageName: String? = nil, title: String? = nil, titleColor: UIColor? = nil, fontSize: CGFloat? = nil) {
        self.init()
        if let imgName = imageName {
            self.setImage(UIImage(named: imgName), for: .normal)
        }
        if let bgImageName = backgroundImageName {
            self.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        }
        if let myTitle = title {
            self.setTitle(myTitle, for: .normal)
        }
        if let myTitleColor = titleColor {
            self.setTitleColor(myTitleColor, for: .normal)
        }
        if let myFontSize = fontSize {
            self.titleLabel?.font = UIFont.systemFont(ofSize: myFontSize)
        }
    }
}

