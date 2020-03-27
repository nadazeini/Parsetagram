//
//  LoginViewController.swift
//  Parsetagram
//
//  Created by Nada Zeini on 3/19/20.
//  Copyright © 2020 Nada Zeini. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
       
        PFUser.logInWithUsername(inBackground: username, password: password) { (success, error) in
            if (success != nil) {
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
           }
          else {
               print("error here")
           }

    }
    }
    @IBAction func onSignup(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
           else {
                print("error")
            }
        }
    }
}
