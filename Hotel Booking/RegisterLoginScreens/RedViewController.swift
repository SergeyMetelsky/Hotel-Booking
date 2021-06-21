//
//  RedViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/18/21.
//

import UIKit

class RedViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    weak var activeField: UITextField?
    var keyboardFrameSize: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(firstRecognizerClicked(_:)))
        view.addGestureRecognizer(tapRecognizer)    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        navigationItem.hidesBackButton = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    //    @objc func keyboardDidShow(notification: Notification) {
    //        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
    //        guard let activeField = activeField, let keyboardHeight = keyboardSize?.height else { return }
    //
    //        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
    //        scrollView.contentInset = contentInsets
    //        scrollView.scrollIndicatorInsets = contentInsets
    //        let activeRect = activeField.convert(activeField.bounds, to: scrollView)
    //        scrollView.scrollRectToVisible(activeRect, animated: true)
    //    }
    //
    //    @objc func keyboardDidHide(notification: Notification) {
    //        let contentInsets = UIEdgeInsets.zero
    //        scrollView.contentInset = contentInsets
    //        scrollView.scrollIndicatorInsets = contentInsets
    //    }
    
    //    MARK:- Functions
    @objc func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        keyboardFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        print(scrollView.contentSize)
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + keyboardFrameSize.height)
        print(scrollView.contentSize)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameSize.height, right: 0)
    }
    @objc func keyboardDidHide() {
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height - keyboardFrameSize.height)
    }
    
    @objc func firstRecognizerClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}



