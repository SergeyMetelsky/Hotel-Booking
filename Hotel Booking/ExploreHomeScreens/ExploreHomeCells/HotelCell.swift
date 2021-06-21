//
//  HotelCell.swift
//  Hotel Booking
//
//  Created by Sergey on 6/1/21.
//

import UIKit

class HotelCell: UICollectionViewCell {

//    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib() 
        view.setupShadowAndRadius()
        backView.setupShadowAndRadius()
    }
    
    func setupCell(hotel: Hotel) {
        self.image.image = hotel.image
        self.nameLabel.text = hotel.name
        self.priceLabel.text = "$ \(hotel.price)"
    }
}
