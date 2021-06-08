//
//  ResetPasswordViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/8/21.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    // MARK:- IBOutlets
    @IBOutlet weak var emailView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var ResetPasswordButton: UIButton!
    
    let customOrange: UIColor = UIColor(red: 242/255, green: 65/255, blue: 49/255, alpha: 1)
    
    // MARK:- ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.setupShadowAndRadius()
        
        emailTextField.setupLeftImage(imageName: "Email Icon")
        
        ResetPasswordButton.layer.cornerRadius = 5
    }
    
    // MARK:- IBActions
    @IBAction func ResetPasswordButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text {
            Auth.auth().languageCode = "ru"
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if error != nil {
                    let errorMessage = error?.localizedDescription ?? "Error"
                    let alertVC = UIAlertController(title: nil, message: errorMessage, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: nil, message: "Check your email", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertVC.addAction(action)
                    self.present(alertVC, animated: true, completion: nil)
                }
            }
        }
    }
}
