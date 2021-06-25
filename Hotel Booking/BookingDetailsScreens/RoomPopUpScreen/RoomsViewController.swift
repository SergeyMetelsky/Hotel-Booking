//
//  RoomsViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/24/21.
//

import UIKit

class RoomsViewController: UIViewController {

    @IBOutlet weak var roomsTableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    var bookingRoom: BookingRoom = BookingRoom()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.navigationItem.title = ""
        
        self.roomsTableView.register(UINib(nibName: "BookingDetailsCell", bundle: nil), forCellReuseIdentifier: "BookingDetailsCell")
        self.roomsTableView.dataSource = self
        self.roomsTableView.delegate = self
        
        self.contentView.setupShadowAndRadius()
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        // реализовать заполнение полей
    }
    
}

extension RoomsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookingRoom.bookingRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingDetailsCell", for: indexPath) as! BookingDetailsCell
        cell.setupCell(item: bookingRoom.bookingRooms[indexPath.item])

        
        cell.cellMinusPressed = {
            guard self.bookingRoom.bookingRooms[indexPath.item].quantity > 0 else { return }
            self.bookingRoom.bookingRooms[indexPath.item].quantity -= 1
            tableView.reloadData()
        }
        cell.cellPlusPressed = {
            self.bookingRoom.bookingRooms[indexPath.item].quantity += 1
            tableView.reloadData()
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

