//
//  ViewController.swift
//  1.AlertController
//
//  Created by 刘渊 on 2017/6/29.
//  Copyright © 2017年 刘渊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "My Title", message: "This is an alert", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("yout have pressed the cancel button")
        }
        
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print("you have pressed OK button")
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true) { () -> Void in
            
        }
        
        
    }
    
    
    @IBAction func ShowActionSheet(_ sender: UIButton) {
     
        let alertController = UIAlertController(title: "My Title", message: "This is an alert", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("you have pressed the cancel button")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print("you have pressed the ok button")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true) { 
            
        }
    }
    
    
    
    @IBAction func AlertWithFrom(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "My title", message: "This is an alert", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("you have pressed the cancel button")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            print("you have pressed ok button")
            
            let userName = alertController.textFields![0].text
            let password = alertController.textFields![1].text
            
            self.doSomething(userName, passWord: password)
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "User Name"
            textField.isSecureTextEntry = false
        }
        
        alertController.addTextField { (textField : UITextField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        
        self.present(alertController, animated: true) { () -> Void in
            
        }
        
        
        
    }
    
    func doSomething(_ userName: String?,passWord: String?){
        print("username \(userName ?? "")  passWord: \(passWord ?? "")")
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

