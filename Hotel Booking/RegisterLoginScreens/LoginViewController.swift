//
//  LoginViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 5/15/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
        
    let customOrange: UIColor = UIColor(red: 242/255, green: 65/255, blue: 49/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        emailView.setupShadowAndRadius()
        passwordView.setupShadowAndRadius()
        
        emailTextField.setupLeftImage(imageName: "Email Icon")
        passwordTextField.setupLeftImage(imageName: "Password Icon")
                
        loginButton.layer.cornerRadius = 5
    }
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        eyeButton.isSelected = !eyeButton.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
//        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
}
