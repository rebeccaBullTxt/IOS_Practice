//
//  UIImage+Extension.swift
//  TestSwift
//
//  Created by 刘渊 on 2018/3/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    /// 使用UIImage(named: imagName) 加载图片,使用此方法
    ///
    /// - Parameter imageName: 图片名称
    class func imageNameWithFilter(imageName: String?) -> UIImage?{

        guard let imgName = imageName else {
            return nil
        }
        
        let img = UIImage(named: imgName)
       
        guard let image = img else { print("图片加载为空"); return nil }
        
        return image
    }

    
    /// 切圆后的图片
    ///
    /// - Parameter image: 要切圆的图片
    /// - Returns: 切圆后的图片
    class func toCircle(image:UIImage) -> UIImage {
        //最短边
        let shotest = min(image.size.width, image.size.height)
        //输出尺寸
        let outPutRect = CGRect(x: 0, y: 0, width: shotest, height: shotest)
        
        UIGraphicsBeginImageContextWithOptions(outPutRect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()!
        //添加圆形裁剪区域
        context.addEllipse(in: outPutRect)
        context.clip()
        
        image.draw(in: CGRect(x: (shotest-image.size.width)/2, y: (shotest-image.size.height)/2, width: image.size.width, height: image.size.height))
        let maskedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return maskedImage
    }
    
    /// 图片切圆,可带边框(适用于圆形头像之类)
    /// - Parameters:
    ///   - image: 要切圆的图片
    ///   - borderWith: 边框宽度
    ///   - borderColor: 边框颜色
    /// - Returns: 切圆后的图片
    class func imageWithClipImage(image:UIImage, borderWidth:CGFloat, borderColor:UIColor) -> UIImage?{
        
        ///具体实现思路:
        //    1.假设边框宽度为BorderW
        //    2.开启的图片上下文的尺寸就应该是原始图片的宽高分别加上两倍的BorderW,这样开启的目的是为了不让原始图片变形.
        //    3.在上下文上面添加一个圆形填充路径.位置从0,0点开始,宽高和上下文尺寸一样大.设置颜色为要设置的边框颜色.
        //    4.继续在上下文上面添加一个圆形路径,这个路径为裁剪路径.
        //    它的x,y分别从BorderW这个点开始.宽度和高度分别和原始图片的宽高一样大.
        //    将绘制的这个路径设为裁剪区域.
        //    5.把原始路径绘制到上下文当中.绘制的位置和是裁剪区域的位置相同,x,y分别从border开始绘制.
        //    6.从上下文状态当中取出图片.
        //    7.关闭上下文状态.
        
        let size = CGSize(width: image.size.width + 2*borderWidth, height: image.size.height + 2*borderWidth)
//        1.开启一个和原始图片一样大小的位图上下文.
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
//        2.绘制一个大圆,填充
        let path = UIBezierPath.init(ovalIn: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        borderColor.set()
        path.fill()
        
//         3.添加一个裁剪区域.
        let path1 = UIBezierPath.init(ovalIn: CGRect(x: borderWidth, y: borderWidth, width: size.width, height: size.height))
        path1.addClip()
//        4.把图片绘制到裁剪区域当中.
        image.draw(at: CGPoint(x: borderWidth, y: borderWidth))
//        5.生成一张新图片.
        let clipImage = UIGraphicsGetImageFromCurrentImageContext();
        //6.关闭上下文
        UIGraphicsEndImageContext()
        
        return clipImage ?? nil
    }
    
    
    /// 根据文字生成水印图片
    ///
    /// - Parameters:
    ///   - imageName: 图片
    ///   - textStr: 水印文字
    ///   - textPoint: 绘制水印文字起点
    ///   - textAttributes: 水印文字属性字典
    /// - Returns: 返回图片
    class func imageWithWaterMarkImage(imageName:String, textStr:String, textPoint:CGPoint, textAttributes:NSDictionary) -> UIImage? {
        
        let img = UIImage(named: imageName)
        
        guard let image = img else {
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
        //图片画上
        image.draw(at: CGPoint.zero)
        //绘制文字到图片
        textStr.draw(at: textPoint, withAttributes: (textAttributes as! [NSAttributedStringKey : Any]))
        //上下文获取图片
        let imageWater = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return imageWater ?? nil
    }
    
    
    /// 根据图片生成水印图片
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - waterImage: 水印图片
    ///   - waterImageRect: 水印图片位置
    /// - Returns: 返回图片
    class func imageWithWaterMarkImage(image:UIImage, waterImage:UIImage, waterImageRect:CGRect) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
        //绘制图片
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        //绘制水印图片到当前上下文
        waterImage.draw(in: waterImageRect)
        //上下文中获取
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    /// 根据颜色生成图片
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - size: 图片尺寸
    /// - Returns: <#return value description#>
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage?{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        //开启 上下文
        UIGraphicsBeginImageContext(rect.size)
        //获取上下文
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        //关闭上下文
        UIGraphicsEndImageContext()
        return image ?? nil
    }
    
    
    /// 截屏或者获取某个view视图
    ///
    /// - Parameter captureView: 要截取的view
    /// - Returns: <#return value description#>
    class func imageWithCaptureView(captureView:UIView) -> UIImage?{
        
        //开启图片上下文
        UIGraphicsBeginImageContextWithOptions(captureView.bounds.size, false, 0)
        //获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        //控件上的图层渲染到上下文
        captureView.layer.render(in: ctx!)
        let screenImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenImage ?? nil
    }
    
    
    /// 图片等比例缩放
    ///
    /// - Parameters:
    ///   - image: 图片
    ///   - scaleToWidth: 要缩放的宽度
    /// - Returns: 返回与原图片等宽高图片
    class func imageWithOriginalImage(image:UIImage, scaleToWidth:CGFloat) -> UIImage? {
        
        let imageSize = image.size
        let imageWidth = imageSize.width
        let imageHeight = imageSize.height
        
        let targetWidth = scaleToWidth
        let targetHeight = imageHeight/(imageWidth/targetWidth)
        let size = CGSize(width: targetWidth, height: targetHeight)
        
        //需要的图片尺寸
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    
    /// 图片的自由拉伸
    ///
    /// - Parameters:
    ///   - name: 图片名
    ///   - capWith: 自由拉伸的宽度
    ///   - capHeight: 自由拉伸的高度
    /// - Returns: 返回图片
    class func imageWithResizedImage(name:String, capWith:CGFloat, capHeight:CGFloat) -> UIImage? {
        let image = UIImage(named: name)
        return image?.stretchableImage(withLeftCapWidth: Int(capWith), topCapHeight: Int(capHeight)) ?? nil
    }
    
}

