//
//  RegisterViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 5/15/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
// MARK:- IBOutlets
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    
    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var loginHereLabel: UILabel!
    
    let customOrange: UIColor = UIColor(red: 242/255, green: 65/255, blue: 49/255, alpha: 1)
    
// MARK:- ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameView.setupShadowAndRadius()
        emailView.setupShadowAndRadius()
        passwordView.setupShadowAndRadius()
        
        nameTextField.setupLeftImage(imageName: "Name Icon")
        emailTextField.setupLeftImage(imageName: "Email Icon")
        passwordTextField.setupLeftImage(imageName: "Password Icon")
        
        agreeButton.layer.cornerRadius = agreeButton.bounds.size.height / 2
        agreeButton.layer.borderWidth = 2
        agreeButton.layer.backgroundColor = UIColor.white.cgColor
        agreeButton.layer.borderColor = customOrange.cgColor
        
        registerButton.layer.backgroundColor = UIColor.lightGray.cgColor
        registerButton.layer.cornerRadius = 5
        
        textPrivacyPolicy()
    }
    
// MARK:- IBActions
    @IBAction func nameTextChanged(_ sender: UITextField) {
    }
    @IBAction func emailTextChanged(_ sender: UITextField) {
    }
    @IBAction func passwordTextChanged(_ sender: UITextField) {
    }
    @IBAction func agreeButtonPressed(_ sender: UIButton) {
        registerButton.isEnabled = !registerButton.isEnabled
        if agreeButton.layer.backgroundColor == UIColor.white.cgColor {
            agreeButton.layer.backgroundColor = customOrange.cgColor
            registerButton.layer.backgroundColor = customOrange.cgColor
        } else {
            agreeButton.layer.backgroundColor = UIColor.white.cgColor
            registerButton.layer.backgroundColor = UIColor.lightGray.cgColor
        }
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    }
    @IBAction func eyeButtonPressed(_ sender: UIButton) {
        eyeButton.isSelected = !eyeButton.isSelected
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    @IBAction func unwindSegueToRegisterScreen(segue: UIStoryboardSegue) {
        
    }
    
    func textPrivacyPolicy() {
        // Create the attributed string
        let myString = NSMutableAttributedString(string:"I hereby agree to the T&C and Privacy Policy.")
        
        // Declare the fonts
        let myStringFont1 = UIFont(name:"Helvetica Neue", size:14.0)!
        let myStringFont2 = UIFont(name:"Helvetica-Bold", size:14.0)!
        
        // Declare the paragraph styles
        let myStringParaStyle1 = NSMutableParagraphStyle()
        myStringParaStyle1.alignment = NSTextAlignment.natural
        myStringParaStyle1.tabStops = [NSTextTab(textAlignment: NSTextAlignment.left, location: 28.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 56.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 84.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 112.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 140.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 168.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 196.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 224.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 252.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 280.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 308.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 336.000000, options: [:]), ]
        
        
        // Create the attributes and add them to the string
        myString.addAttribute(NSAttributedString.Key.font, value:myStringFont1, range:NSRange(location: 0, length: 22))
        myString.addAttribute(NSAttributedString.Key.paragraphStyle, value:myStringParaStyle1, range:NSRange(location: 0, length: 22))
        myString.addAttribute(NSAttributedString.Key.font, value:myStringFont2, range:NSRange(location: 22, length: 23))
        myString.addAttribute(NSAttributedString.Key.paragraphStyle, value:myStringParaStyle1, range:NSRange(location: 22, length: 23))
        myString.addAttribute(NSAttributedString.Key.underlineStyle, value:1, range:NSRange(location: 22, length: 23))
        
        agreeLabel.attributedText = myString
    }
}

// MARK:- extension UITextField
extension UITextField {
    
    //MARK:- Set Image on the right of text fields
    func setupRightImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageContainerView.addSubview(imageView)
        rightView = imageContainerView
        rightViewMode = .always
        self.tintColor = .lightGray
    }
    
    //MARK:- Set Image on left of text fields
    func setupLeftImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageContainerView.addSubview(imageView)
        leftView = imageContainerView
        leftViewMode = .always
        self.tintColor = .lightGray
    }
}

// MARK:- extension UIView
extension UIView {
    
    //MARK:- Set shadow and radius of View
    func setupShadowAndRadius() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 3
    }
}





