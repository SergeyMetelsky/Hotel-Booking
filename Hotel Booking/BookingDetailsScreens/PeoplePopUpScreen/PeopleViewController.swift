//
//  PeopleViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/23/21.
//

import UIKit

let peopleViewControllerNotification = NSNotification.Name(rawValue: "peopleViewControllerNotification")

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    var roomRenter: RoomRenter = RoomRenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.navigationItem.title = ""
        
        self.peopleTableView.register(UINib(nibName: "BookingDetailsCell", bundle: nil), forCellReuseIdentifier: "BookingDetailsCell")
        self.peopleTableView.dataSource = self
        self.peopleTableView.delegate = self
        
        self.contentView.setupShadowAndRadius()
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        // если польщователь не заполнил поля то кнопка не будет работать
        for renter in roomRenter.roomRenters {
            if renter.quantity != 0 {
                NotificationCenter.default.post(name: peopleViewControllerNotification, object: roomRenter)
                dismiss(animated: true, completion: nil)
                break
            }
        }
        return
    }
}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomRenter.roomRenters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingDetailsCell", for: indexPath) as! BookingDetailsCell
//        var renter = roomRenter.roomRenters[indexPath.item]
//        cell.setupCell(renter: renter)
        cell.setupCell(item: roomRenter.roomRenters[indexPath.item])

        
        cell.cellMinusPressed = {
//            renter.quantity -= 1
            guard self.roomRenter.roomRenters[indexPath.item].quantity > 0 else { return }
            self.roomRenter.roomRenters[indexPath.item].quantity -= 1
            tableView.reloadData()
//            cell.quantityLabel.text = String(renter.quantity)
        }
        cell.cellPlusPressed = {
//            renter.quantity += 1
            self.roomRenter.roomRenters[indexPath.item].quantity += 1
            tableView.reloadData()
//            cell.quantityLabel.text = String(renter.quantity)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}