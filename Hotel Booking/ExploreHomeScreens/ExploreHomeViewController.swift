//
//  ExploreHomeViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/1/21.
//

import UIKit

class ExploreHomeViewController: UIViewController {
    
    // MARK:- IBOutlets
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var dataInView: UIView!
    @IBOutlet weak var dataInTextField: UITextField!
    
    @IBOutlet weak var dataOutView: UIView!
    @IBOutlet weak var dataOutTextField: UITextField!
    
    @IBOutlet weak var peopleView: UIView!
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var catalog: Catalog = Catalog()
    var location: Location = Location()
    var list: List = List()

    
    // MARK:- ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        locationView.setupShadowAndRadius()
        dataInView.setupShadowAndRadius()
        dataOutView.setupShadowAndRadius()
        peopleView.setupShadowAndRadius()
        
        locationTextField.setupLeftImage(imageName: "location Icon")
        dataInTextField.setupLeftImage(imageName: "data Icon")
        dataOutTextField.setupLeftImage(imageName: "data Icon")
        peopleTextField.setupLeftImage(imageName: "people Icon")

        searchButton.layer.cornerRadius = 5
        
        collectionView.register(UINib(nibName: "HotelCell", bundle: nil), forCellWithReuseIdentifier: "HotelCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
//        NetworkManagerLocation.fetch(query: "minsk", locale: "ru_RU") { [weak self] (location) in
//            guard let self = self else {return}
//            self.location = location
////            self.collectionView.reloadData()
//        }
        
        NetworkManagerList.fetch(destinationId: "118894", locale: "ru_RU") { [weak self] (list) in
            guard let self = self else {return}
            self.list = list
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    // MARK:- IBActions
    @IBAction func unwingToExploreHomeScreen(_ sender: UIStoryboardSegue) {
    }
}

extension ExploreHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // количество ячеек задаем
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return catalog.hotels.count
        guard let count = self.list.data?.body?.searchResults?.results?.count else { return 0 }
        return count
    }
    
    // внешний вид и содержание задаем
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotelCell", for: indexPath) as! HotelCell
        //        let hotel = catalog.hotels[indexPath.item]
        guard let hotel = self.list.data?.body?.searchResults?.results?[indexPath.item] else { return cell }
        cell.setupCell(hotel: hotel)
        return cell
    }
    
    //  размер ячейки задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        return CGSize(width: 160, height: 168)
        return CGSize(width: 160, height: 200)
        
    }
    
    // отспут между ячейками задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}
