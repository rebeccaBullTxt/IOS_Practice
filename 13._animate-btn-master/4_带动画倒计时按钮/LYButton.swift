//
//  LYButton.swift
//  5.带动画倒计时按钮
//
//  Created by 刘渊 on 2017/7/5.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit

enum CountBtnType {
    case LYBtnTypeScale
    case LYBtnTypeRotate
}

class LYButton: UIButton {

    //正常红色
    private var normal_bgColor = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)
    
    //倒计时中颜色
    var enalbe_bgColor = UIColor.lightGray
    
    private var timer: Timer!
    private var startCount = 0
    private var originNum = 0
    
    //倒计时label
    private var timeLabel = UILabel()
    var animaType = CountBtnType.LYBtnTypeScale
    
    //便利构造函数
    convenience init(count: Int,frame: CGRect,color: UIColor?) {
        var color = color
        
        self.init(frame:frame)
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        
        if color == nil {
            color = normal_bgColor
        }else{
            normal_bgColor = color!
        }
        
        self.backgroundColor = color
        self.startCount = count
        self.originNum = count
        self.addLabel()
        self.addTarget(self, action: #selector(startCountDown), for: .touchUpInside)
        
    }
    
    
    func addLabel(){
        
        timeLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        timeLabel.backgroundColor = UIColor.clear
        timeLabel.font = UIFont.systemFont(ofSize: 17)
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.text = "\(self.originNum)"
        self.addSubview(timeLabel)
    }
    
    
    func startCountDown(){
        //开启定时器
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        self.backgroundColor = enalbe_bgColor
        self.isEnabled = false
        
        switch self.animaType {
        case .LYBtnTypeScale:
            self.numAnimation()
        case .LYBtnTypeRotate:
            self.rotateAnimation()
        }
        
        
    }
    
    //倒计时开始
    func countDown(){
        
        self.startCount -= 1
        timeLabel.text = "\(self.startCount)"
        
        //倒计时完成后停止定时器,移除动画
        if self.startCount < 0{
            if self.timer == nil {
                return
            }
            
            timeLabel.layer.removeAllAnimations()
            timeLabel.text = "\(self.originNum)"
            self.timer.invalidate()
            self.timer = nil
            self.isEnabled = true
            self.startCount = self.originNum
            self.backgroundColor = normal_bgColor
        }
        
    }
    
    //放大动画
    func numAnimation(){
        
        let duration : CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0,0.5,1]
        scaleAnimation.values = [1,1.5,2]
        scaleAnimation.duration = duration
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.keyTimes = [0,0.5,1]
        opacityAnimation.values = [1,0.5,0]
        opacityAnimation.duration = duration
        
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation,opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        animation.beginTime = beginTime
        timeLabel.layer.add(animation, forKey: "animation")
        self.layer.addSublayer(timeLabel.layer)
        
        
    }
    
    //旋转变小动画
    func rotateAnimation(){
        
        let duration: CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        
        
        //Rotate animation
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotateAnimation.fromValue = NSNumber(value: 0)
        rotateAnimation.toValue = NSNumber(value: M_PI * 2)
        rotateAnimation.duration = duration
        
        //Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes = [0]
        scaleAnimation.values = [1,2]
        scaleAnimation.duration = 0
        
        //opacity animation 
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.keyTimes = [0,0.5]
        opacityAnimation.values = [1,0]
        opacityAnimation.duration = duration
        
        //Scale animation
        let scaleAnimation2 = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation2.keyTimes = [0,0.5]
        scaleAnimation2.values = [2,0]
        scaleAnimation2.duration = duration
        
        let animation = CAAnimationGroup()
        
        animation.animations = [rotateAnimation,scaleAnimation,opacityAnimation,scaleAnimation2]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = beginTime
        timeLabel.layer.add(animation, forKey: "animation")
        self.layer.addSublayer(timeLabel.layer)
        
        //        let shakeAnimation = CABasicAnimation(keyPath: "transform.translation.x")
        //
        //        shakeAnimation.duration = 0.08;
        //        shakeAnimation.fromValue = NSNumber(int: -5)
        //        shakeAnimation.toValue = NSNumber(int: 5)
        //        shakeAnimation.repeatCount = 4
        //        shakeAnimation.autoreverses = YES;
        //        timeLabel.layer.addAnimation(shakeAnimation, forKey: nil)
        //        self.layer.addSublayer(timeLabel.layer)

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
