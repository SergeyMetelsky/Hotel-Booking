//
//  ExploreHomeViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 6/1/21.
//

import UIKit

class ExploreHomeViewController: UIViewController {
    
//    MARK:- Properties
    var currentDate = Date()
    var formatter = DateFormatter()
    var dateComponent = DateComponents()
    var catalog: Catalog = Catalog()
    var location: Location = Location()
    var list: List = List()

    
    // MARK:- IBOutlets
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var checkInView: UIView!
    @IBOutlet weak var checkInTextField: UITextField!
    
    @IBOutlet weak var checkOutView: UIView!
    @IBOutlet weak var checkOutTextField: UITextField!
    
    @IBOutlet weak var peopleView: UIView!
    @IBOutlet weak var peopleTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    // MARK:- ViewController Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formatter.dateFormat = "dd MMM, yyy"
        dateComponent.day = 1
        guard let checkOutDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) else { return }
        let checkInDateString: String? = formatter.string(from: currentDate)
        let checkOutDateString: String = formatter.string(from: checkOutDate)
        checkInTextField.text = checkInDateString
        checkOutTextField.text = checkOutDateString
        
        locationView.setupShadowAndRadius()
        checkInView.setupShadowAndRadius()
        checkOutView.setupShadowAndRadius()
        peopleView.setupShadowAndRadius()
        
        locationTextField.setupLeftImage(imageName: "location Icon")
        checkInTextField.setupLeftImage(imageName: "data Icon")
        checkOutTextField.setupLeftImage(imageName: "data Icon")
        peopleTextField.setupLeftImage(imageName: "people Icon")

        searchButton.layer.cornerRadius = 5
        
        collectionView.register(UINib(nibName: "HotelCell", bundle: nil), forCellWithReuseIdentifier: "HotelCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
       // MARK:- Поисковой запрос. Выдает различные варианты ответов
//        NetworkManagerLocation.fetch(query: "minsk", locale: "ru_RU") { [weak self] (location) in
//            guard let self = self else {return}
//            self.location = location
////            self.collectionView.reloadData()
//        }
        
        // MARK:- Запрос списка отелей в соответствии с выбранным поисковым запросом
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
    @IBAction func viewAllButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TopHotels", bundle: nil)
//        guard let destinationVC = storyboard.instantiateViewController(identifier: "TopHotelsViewController") as? TopHotelsViewController else { return }
        guard let destinationVC = storyboard.instantiateViewController(identifier: "TabBarController") as? TabBarController else { return }
        
//        destinationVC.list = self.list
        destinationVC.catalog = self.catalog
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

extension ExploreHomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // количество ячеек задаем
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catalog.hotels.count
//        guard let count = self.list.data?.body?.searchResults?.results?.count else { return 0 }
//        return count
    }
    
    // внешний вид и содержание задаем
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotelCell", for: indexPath) as! HotelCell
                let hotel = catalog.hotels[indexPath.item]
//        guard let hotel = self.list.data?.body?.searchResults?.results?[indexPath.item] else { return cell }
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
    
    // отрабатываем нажатие на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let hotel = list.data?.body?.searchResults?.results?[indexPath.row] else { return }
        let storyboard = UIStoryboard(name: "HotelDescription", bundle: nil)
        guard let destinationVC = storyboard.instantiateViewController(identifier: "HotelDescriptionViewController") as? HotelDescriptionViewController else { return }
        destinationVC.hotel = hotel
        navigationController?.pushViewController(destinationVC, animated: true)
//        show(destinationVC, sender: nil)
    }
}

