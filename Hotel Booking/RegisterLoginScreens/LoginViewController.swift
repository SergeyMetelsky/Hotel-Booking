//
//  LoginViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 5/15/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK:- IBOutlets
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    
    let customOrange: UIColor = UIColor(red: 242/255, green: 65/255, blue: 49/255, alpha: 1)
   
    // MARK:- ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.setupShadowAndRadius()
        passwordView.setupShadowAndRadius()
        
        emailTextField.setupLeftImage(imageName: "Email Icon")
        passwordTextField.setupLeftImage(imageName: "Password Icon")
        
        loginButton.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    // MARK:- IBActions
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        eyeButton.isSelected = !eyeButton.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    }
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "resetPasswordSegue", sender: nil)
    }
    @IBAction func unwindSegueToLoginScreen(segue: UIStoryboardSegue) {
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    self.performSegue(withIdentifier: "goToExploreHomeStoryboard", sender: nil)
                } else {
                    let errorMessage = error?.localizedDescription ?? "Error"
                    let alertVC = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
    }
}
