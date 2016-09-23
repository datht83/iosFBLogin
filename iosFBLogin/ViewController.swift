//
//  ViewController.swift
//  iosFBLogin
//
//  Created by Huynh Dat on 9/23/16.
//  Copyright © 2016 HuynhDat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func handleLogin(_ sender: AnyObject) {
        let userName = txtUsername.text!
        let password = txtPassword.text!
        
        if userName == "dat" && password == "123456" {
            //down cast vi homeVC tra ve 1 ViewController
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
            
            homeVC.name = userName
            
            self.navigationController?.pushViewController(homeVC, animated: true)
            
        } else {
            print("login failed")
        }
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

