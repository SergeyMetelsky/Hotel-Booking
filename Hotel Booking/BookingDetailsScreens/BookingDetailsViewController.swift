//
//  BookingDetailsViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/1/21.
//

import UIKit

class BookingDetailsViewController: UIViewController, UITextFieldDelegate {
    
//    MARK:- Properties
    var formatter = DateFormatter()
//    let nm = NetworkManager()
    
    //    MARK:- IBOutlets
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var dataInView: UIView!
    @IBOutlet weak var dataInTextField: UITextField!
    
    @IBOutlet weak var dataOutView: UIView!
    @IBOutlet weak var dataOutTextField: UITextField!
    
    @IBOutlet weak var peopleView: UIView!
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var roomView: UIView!
    @IBOutlet weak var roomTextField: UITextField!
    
    @IBOutlet weak var bookNowButton: UIButton!

    //    MARK:- LifeCycleController
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NetworkManagerLocation.fetch(query: "minsk", locale: "ru_RU") { (data) in
//            print("_____NetworkManager.fetch: \(data)")
//        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(checkInNotificationFromCalendarViewController(_:)),
                                               name: checkInCalendarViewControllerNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(checkOutNotificationFromCalendarViewController(_:)),
                                               name: checkOutCalendarViewControllerNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(peopleNotificationFromPeopleViewController(_:)),
                                               name: peopleViewControllerNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(roomNotificationFromRoomsViewControllerr(_:)),
                                               name: roomViewControllerNotification,
                                               object: nil)
        
        nameView.setupShadowAndRadius()
        phoneView.setupShadowAndRadius()
        dataInView.setupShadowAndRadius()
        dataOutView.setupShadowAndRadius()
        peopleView.setupShadowAndRadius()
        roomView.setupShadowAndRadius()
        
        nameTextField.setupLeftImage(imageName: "name Icon")
        phoneTextField.setupLeftImage(imageName: "phone Icon")
        dataInTextField.setupLeftImage(imageName: "data Icon")
        dataOutTextField.setupLeftImage(imageName: "data Icon")
        peopleTextField.setupLeftImage(imageName: "people Icon")
        roomTextField.setupLeftImage(imageName: "room Icon")
        
        bookNowButton.layer.cornerRadius = 5
        
        nameTextField.delegate = self
        phoneTextField.delegate = self
        dataInTextField.delegate = self
        dataOutTextField.delegate = self
        peopleTextField.delegate = self
        roomTextField.delegate = self
        
        peopleTextField.addTarget(self, action: #selector(goToPeopleVC), for: .touchDown)
        roomTextField.addTarget(self, action: #selector(goToRoomsVC), for: .touchDown)
        dataInTextField.addTarget(self, action: #selector(goToCalendarVC), for: .touchDown)
        dataOutTextField.addTarget(self, action: #selector(goToCalendarVC), for: .touchDown)
        
        
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstRecognizerClicked(_:)))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //    MARK:- IBActions
    @IBAction func bookNowButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPaymentCheckoutStoryboard", sender: nil)
    }
    
    //    MARK:- Functions
    @objc func goToPeopleVC(textField: UITextField) {
        // очиска перед следующим вызовом контроллера заполнения
        peopleTextField.text?.removeAll()
        performSegue(withIdentifier: "goToPeople", sender: nil)
    }
    @objc func goToRoomsVC(textField: UITextField) {
        // очиска перед следующим вызовом контроллера заполнения
        roomTextField.text?.removeAll()
        performSegue(withIdentifier: "goToRooms", sender: nil)
    }
    @objc func goToCalendarVC(textField: UITextField) {
        let sourceTextField = textField.accessibilityIdentifier
        let destinationVC = storyboard?.instantiateViewController(identifier: "CalendarViewController") as! CalendarViewController
        
        switch sourceTextField {
        case "checkIn":
            destinationVC.sourceTextField = "checkIn"
        case "checkOut":
            destinationVC.sourceTextField = "checkOut"
        default:
            return
        }
        
        destinationVC.modalPresentationStyle = .overCurrentContext
        present(destinationVC, animated: true, completion: nil)
        //        performSegue(withIdentifier: "goToCalendar", sender: nil)
    }
    @objc func firstRecognizerClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @objc func checkInNotificationFromCalendarViewController(_ notification: Notification) {
        if let date = notification.object as? Date {
            formatter.dateFormat = "dd MMM, yyy"
            dataInTextField.text = "\(formatter.string(from: date))"
        }
    }
    @objc func checkOutNotificationFromCalendarViewController(_ notification: Notification) {
        if let date = notification.object as? Date {
            formatter.dateFormat = "dd MMM, yyy"
            dataOutTextField.text = "\(formatter.string(from: date))"
        }
    }
    @objc func peopleNotificationFromPeopleViewController(_ notification: Notification) {
        guard let roomRenter = notification.object as? RoomRenter else { return }
        for renter in roomRenter.roomRenters {
            if renter.quantity != 0 {
                if peopleTextField.text == "" {
                    peopleTextField.text! += "\(renter.quantity) \(renter.name)"
                } else {
                    peopleTextField.text! += ", \(renter.quantity) \(renter.name)"
                }
            }
        }
    }
    @objc func roomNotificationFromRoomsViewControllerr(_ notification: Notification) {
        guard let bookingRoom = notification.object as? BookingRoom else { return }
        for room in bookingRoom.bookingRooms {
            if room.quantity != 0 {
                if roomTextField.text == "" {
                    roomTextField.text! += "\(room.quantity) \(room.name)"
                } else {
                    roomTextField.text! += ", \(room.quantity) \(room.name)"
                }
            }
        }
    }
}
