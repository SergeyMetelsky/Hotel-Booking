//
//  Catalog.swift
//  Hotel Booking
//
//  Created by Sergey on 6/21/21.
//

import Foundation
import UIKit

class Catalog {
    
    var hotels: [Hotel] = []
    
    init() {
        setup()
    }
    
    func setup() {
        let hotel1 = Hotel(image: UIImage(named: "hotel 1")!, name: "Hotel 1", price: "999")
        let hotel2 = Hotel(image: UIImage(named: "hotel 2")!, name: "Hotel 2", price: "1399")
        let hotel3 = Hotel(image: UIImage(named: "hotel 3")!, name: "Hotel 3", price: "1999")
        let hotel4 = Hotel(image: UIImage(named: "hotel 4")!, name: "Hotel 4", price: "2500")
        
        self.hotels = [hotel1, hotel2, hotel3, hotel4]
    }
}
