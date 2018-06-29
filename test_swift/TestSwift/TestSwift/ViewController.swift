//
//  ViewController.swift
//  TestSwift
//
//  Created by 刘渊 on 2018/3/23.
//  Copyright © 2018年 com.yuanliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageV = UIImageView(frame: CGRect(x: 50, y: 30, width: 100, height: 100))
        
//        imageV.image = UIImage.imageWithResizedImage(name: "nightKing", capWith: 10, capHeight: 20)
        imageV.image = UIImage.imageWithOriginalImage(image: UIImage.imageNameWithFilter(imageName: "nightKing")!, scaleToWidth: 10)
        self.view.addSubview(imageV)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
