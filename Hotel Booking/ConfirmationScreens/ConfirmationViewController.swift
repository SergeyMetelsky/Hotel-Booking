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
        
        navigationItem.hidesBackButton = true
        
    }
    
    @IBAction func goBackButtonPressed(_ sender: UIButton) {
    }
    @IBAction func unwindSegueToConfirmationScreen(segue: UIStoryboardSegue) {
        
    }
}
