//
//  CofirmationViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 5/28/21.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var goBackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = "Booking"
        goBackButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToRegisterLoginStoryboard", sender: nil)
    }
    @IBAction func unwindSegueToConfirmationScreen(segue: UIStoryboardSegue) {
        
    }
}
