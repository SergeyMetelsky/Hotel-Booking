//
//  BookingDetailsViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/1/21.
//

import UIKit

class BookingDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var dataInView: UIView!
    @IBOutlet weak var dataInTextField: UITextField!
    
    @IBOutlet weak var dataOutView: UIView!
    @IBOutlet weak var dataOutTextField: UITextField!
    
    @IBOutlet weak var peopleView: UIView!
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var roomView: UIView!
    @IBOutlet weak var roomTextField: UITextField!
    
    @IBOutlet weak var bookNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameView.setupShadowAndRadius()
        phoneView.setupShadowAndRadius()
        dataInView.setupShadowAndRadius()
        dataOutView.setupShadowAndRadius()
        peopleView.setupShadowAndRadius()
        roomView.setupShadowAndRadius()
        
        nameTextField.setupLeftImage(imageName: "name Icon")
        phoneTextField.setupLeftImage(imageName: "phone Icon")
        dataInTextField.setupLeftImage(imageName: "data Icon")
        dataOutTextField.setupLeftImage(imageName: "data Icon")
        peopleTextField.setupLeftImage(imageName: "people Icon")
        roomTextField.setupLeftImage(imageName: "room Icon")
        
        bookNowButton.layer.cornerRadius = 5
    }
}
