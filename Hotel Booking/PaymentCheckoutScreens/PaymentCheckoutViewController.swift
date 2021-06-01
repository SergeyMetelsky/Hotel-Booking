//
//  PaymentCheckoutViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 5/28/21.
//

import UIKit

class PaymentCheckoutViewController: UIViewController {
    
    @IBOutlet weak var paymentTableView: UITableView!
    
    var paymentService: PaymentService = PaymentService()
    let separatorColor: UIColor = UIColor(red: 219, green: 219, blue: 222, alpha: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Payment Options"
        
        self.paymentTableView.register(UINib(nibName: "PaymentCheckoutTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentCheckoutTableViewCell")
        self.paymentTableView.dataSource = self
        self.paymentTableView.delegate = self
        
        self.paymentTableView.separatorColor = separatorColor
    }
}

extension PaymentCheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentService.paymentServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCheckoutTableViewCell", for: indexPath) as! PaymentCheckoutTableViewCell
        let payService = paymentService.paymentServices[indexPath.item]
        cell.setupCell(service: payService)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToConfirmationStoryboard", sender: self)
    }
}
