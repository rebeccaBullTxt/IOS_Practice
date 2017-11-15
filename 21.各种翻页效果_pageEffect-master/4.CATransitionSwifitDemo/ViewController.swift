//
//  ViewController.swift
//  4.CATransitionSwifitDemo
//
//  Created by 刘渊 on 2017/7/4.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit

enum AnimationType:Int {
    case fade = 1,              //淡入淡出
    push,                       //推挤
    reveal,                     //揭开
    moveIn,                     //覆盖
    cube,                       //立方体
    suckEffect,                 //吮吸
    oglFlip,                    //翻转
    rippleEffect,               //波纹
    pageCurl,                   //翻页
    pageUnCurl,                 //反翻页
    cameraIrisHollowOpen,       //开镜头
    cameraIrisHollowClose,      //关镜头
    curlDown,                   //下翻页
    curlUp,                     //上翻页
    flipFromLeft,               //左翻转
    flipFromRight             //右翻转
    
}


class ViewController: UIViewController {

    let duration = 0.7
    
    let image1 = "01.jpg"
    let image2 = "02.jpg"
    
    var imageType = 0
    var _subtype = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBgImageWithImageName(image2)
        
        
    }
 
    //给view添加背景图片
    func addBgImageWithImageName(_ imageName: String){
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: imageName)!)
    }
    
    func transitionWithType(_ type:String,withSubType subType:String,forView view:UIView){
        
        let animation = CATransition()
        
        animation.duration = duration
        
        animation.type = type
        
        if !subType.isEmpty {
            
            //设置子类
            animation.subtype = subType
        }
        
        //运动速度
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        view.layer.add(animation, forKey: "animation")
        
    }
    
    
    func animationWithView(_ view:UIView,withAnimationTransition transition: UIViewAnimationTransition){
        
        UIView.animate(withDuration: duration) {
            //设置动画变化规律
            
            /*
             UIViewAnimationCurveEaseInOut,	 开始和结束减速	// slow at beginning and end
             UIViewAnimationCurveEaseIn,			// slow at beginning
             UIViewAnimationCurveEaseOut,		   // slow at end
             UIViewAnimationCurveLinear		   匀速
             */
            UIView.setAnimationCurve(UIViewAnimationCurve.easeInOut)
            
            
            /*
             UIViewAnimationTransitionNone,
             UIViewAnimationTransitionFlipFromLeft,
             UIViewAnimationTransitionFlipFromRight,
             UIViewAnimationTransitionCurlUp,
             UIViewAnimationTransitionCurlDown,
             转场动画方向
             */
            UIView.setAnimationTransition(transition, for: view, cache: true)
        }
    }
    
    
    @IBAction func tapButton(_ sender: AnyObject) {
        
        let btn = sender as! UIButton
        let animationType = AnimationType(rawValue: btn.tag)!
        
        var subTypeString:String
        
        switch _subtype {
        case 0:
            subTypeString = kCATransitionFromLeft
            //左边进入
        case 1:
            subTypeString = kCATransitionFromBottom
            //底部
        case 2:
            subTypeString = kCATransitionFromRight
            //右边
        case 3:
            subTypeString = kCATransitionFromTop
            //顶部
        default:
            subTypeString = kCATransitionFromLeft
        }
        
        
        _subtype += 1
        
        if (_subtype > 3) {
            _subtype = 0
        }
        
        
            switch(animationType){
                //淡入淡出
            case .fade:
            self.transitionWithType(kCATransitionFade, withSubType: subTypeString, forView: self.view)
            
                //推挤
            case .push:
            self.transitionWithType(kCATransitionPush, withSubType: subTypeString, forView: self.view)
                
                //揭开
            case .reveal:
            self.transitionWithType(kCATransitionReveal, withSubType: subTypeString, forView: self.view)
                
                //覆盖
            case .moveIn:
            self.transitionWithType(kCATransitionMoveIn, withSubType: subTypeString, forView: self.view)
            
            
                //立方体
            case .cube:
            self.transitionWithType("cube", withSubType: subTypeString, forView: self.view)
            
                //吮吸
            case .suckEffect:
            self.transitionWithType("suckEffect", withSubType: subTypeString, forView: self.view)
            
                //翻转
            case .oglFlip:
            self.transitionWithType("oglFlip", withSubType: subTypeString, forView: self.view)
                
                //波纹
            case .rippleEffect:
            self.transitionWithType("rippleEffect", withSubType: subTypeString, forView: self.view)
            
                //翻页
            case .pageCurl:
            self.transitionWithType("pageCurl", withSubType: subTypeString, forView: self.view)
            
                //反翻页
            case .pageUnCurl:
            self.transitionWithType("pageUnCurl", withSubType: subTypeString, forView: self.view)
            
                //开镜头
            case .cameraIrisHollowOpen:
            self.transitionWithType("cameraIrisHollowOpen", withSubType: subTypeString, forView: self.view)
                
                //关镜头
            case .cameraIrisHollowClose:
            self.transitionWithType("cameraIrisHollowClose", withSubType: subTypeString, forView: self.view)
            
                
                
                //下翻页
            case .curlDown:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.curlDown)
            
                //上翻页
            case .curlUp:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.curlUp)
            
                //左翻转
            case .flipFromLeft:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.flipFromLeft)
            
                //右翻转
            case .flipFromRight:
            self.animationWithView(self.view, withAnimationTransition: UIViewAnimationTransition.flipFromRight)
        }
        
        
        if imageType == 0 {
            self.addBgImageWithImageName(image1)
            imageType = 1
        }else{
            self.addBgImageWithImageName(image2)
            imageType = 0
        }
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

