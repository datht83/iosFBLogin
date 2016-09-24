//
//  ViewController.swift
//  iosFBLogin
//
//  Created by Huynh Dat on 9/23/16.
//  Copyright © 2016 HuynhDat. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    let login:FBSDKLoginManager = FBSDKLoginManager()
    
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
    
    @IBAction func handleLoginFB(_ sender: AnyObject) {
        
        login.logIn(withReadPermissions: ["public_profile"], from: self) { (result, error) in
            if error == nil {
                print(result?.token.tokenString)
            } else {
                print("login that bai")
            }
        }
    }
    
    @IBAction func handleLogout(_ sender: AnyObject) {
        login.logOut()
        if FBSDKAccessToken.current() == nil {
            print("da log out")
        } else {
            print("====================")
        }
    }
    @IBAction func getAction(_ sender: AnyObject) {
        
        if FBSDKAccessToken.current() == nil {
            print("da log out")
            
        } else {
            let request:FBSDKGraphRequest = FBSDKGraphRequest.init(graphPath: "/me", parameters: ["fields":"id,name,birthday,email"], httpMethod: "GET")
            request.start(completionHandler: { (connection, result, error) in
                if error == nil {
                    let userDict = result as! [String:AnyObject]
                    let email = userDict["email"] as! String
                    
                    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! HomeViewController
                    
                    homeVC.name = email
                    
                    self.navigationController?.pushViewController(homeVC, animated: true)
                } else {
                    
                }
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // su dung nut dang nhap mac dinh cua facebook
        /*
        let loginButton:FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        if FBSDKAccessToken.current() == nil {
            print("chua login")
        } else {
            print("da login")
        }
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // su dung FBSDKLoginButtonDelegate phai co 2 function duoi day
//    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
//        print("da login")
//    }
//    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        print("da logout")
//    }


}

