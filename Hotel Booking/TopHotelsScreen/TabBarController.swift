//
//  TabBarController.swift
//  Hotel Booking
//
//  Created by Sergey on 7/22/21.
//

import UIKit

class TabBarController: UITabBarController {
    var catalog: Catalog?
    var list: List?
    var location: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            if let topHotelsViewController = viewController as? TopHotelsViewController, let list = self.list, let location = self.location {
//                topHotelsViewController.catalog = self.catalog
                topHotelsViewController.location = location
                topHotelsViewController.list = list
            }
        }
        
//        guard let destinationVC = storyboard?.instantiateViewController(identifier: "TopHotelsViewController") as? TopHotelsViewController else { return }
//        guard let catalog = self.catalog else { return }
////                destinationVC.list = self.list
//        destinationVC.catalog = catalog
    }
}
