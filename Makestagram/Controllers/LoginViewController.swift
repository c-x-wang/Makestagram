//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Cindy Wang on 7/9/18.
//  Copyright © 2018 cxw. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("login button tapped")
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        guard let user = user
            else { return }
        
//        let userRef = Database.database().reference().child("users").child(user.uid)
        
//        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            if let user = User(snapshot: snapshot) {
//                print ("Welcome back, \(user.username).")
//            } else {
//                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//            }
//        })
        
//        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
//            if let _ = User(snapshot: snapshot) {
//                let storyboard = UIStoryboard(name: "Main", bundle: .main)
//
//                if let initialViewController = storyboard.instantiateInitialViewController() {
//                    self.view.window?.rootViewController = initialViewController
//                    self.view.window?.makeKeyAndVisible()
//                } else {
//                    self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//                }
//            }
//        })
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                User.setCurrent(user, writeToUserDefaults: true)
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        }
    }
}

