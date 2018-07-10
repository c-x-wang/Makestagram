//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Cindy Wang on 7/10/18.
//  Copyright © 2018 cxw. All rights reserved.
//

import UIKit

class CreateUsernameViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.cornerRadius = 6
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // create new user in database
    }
}
