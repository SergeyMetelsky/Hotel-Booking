//
//  BookingRoom.swift
//  Hotel Booking
//
//  Created by Sergey on 6/24/21.
//

import Foundation

class BookingRoom {
    var bookingRooms: [Room] = []
    
    init() {
        setup()
    }
    
    func setup() {
        let bookingRoomCategory1 = Room(name: "Single Deluxe Room", description: "Single Bed + Free Breakfast", quantity: 0)
        let bookingRoomCategory2 = Room(name: "Double Deluxe Room", description: "Double Bed + Free Breakfast", quantity: 0)
        let bookingRoomCategory3 = Room(name: "Extra Bed", description: "Extra Matrass for children", quantity: 0)
        let bookingRoomCategory4 = Room(name: "Premium Suite", description: "Double Bed + Free Meals", quantity: 0)
        self.bookingRooms = [bookingRoomCategory1, bookingRoomCategory2, bookingRoomCategory3, bookingRoomCategory4]
    }
}
