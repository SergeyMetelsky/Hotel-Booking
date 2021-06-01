//
//  PaymentCheckoutCollectionViewCell.swift
//  Hotel Booking
//
//  Created by Sergey on 5/28/21.
//

import UIKit

class PaymentCheckoutTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var separator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(service: Service) {
        self.logoImage.image = service.logoImage
        self.label.text = service.seviceName
        self.arrowImage.image = service.arrowImage
        self.separator.backgroundColor = UIColor.separator
    }
}
