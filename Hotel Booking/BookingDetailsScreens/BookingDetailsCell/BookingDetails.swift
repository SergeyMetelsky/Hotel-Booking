//
//  BookingDetails.swift
//  Hotel Booking
//
//  Created by Sergey on 6/24/21.
//

import Foundation

protocol BookingDetails {
    var name: String { get set }
    var description: String { get set }
    var quantity: Int { get set }
}
