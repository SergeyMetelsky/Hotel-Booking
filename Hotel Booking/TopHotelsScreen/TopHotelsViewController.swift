//
//  TopHotelsViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 7/21/21.
//

import UIKit

class TopHotelsViewController: UIViewController {
    
    var catalog: Catalog?
    var wishListCatalog: [Hotel] = []
    var list: List?

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tapBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "TopHotelsCell", bundle: nil), forCellWithReuseIdentifier: "TopHotelsCell")
        collectionView.dataSource = self
        collectionView.delegate = self
//        let vc2 = WishlistViewController()
    }
}

extension TopHotelsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // количество ячеек задаем
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = catalog?.hotels.count else { return 0 }
        return count
//        guard let count = self.list?.data?.body?.searchResults?.results?.count else { return 0 }
//        return count
    }
    
    // внешний вид и содержание задаем
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopHotelsCell", for: indexPath) as! TopHotelsCell
        guard let hotel = catalog?.hotels[indexPath.item] else { return cell }
//        guard let hotel = self.list?.data?.body?.searchResults?.results?[indexPath.item] else { return cell }
        cell.setupCell(hotel: hotel)
//        cell.bookNowButtonPressed = {
//            if self.wishListCatalog.contains(where: { $0.name == }) {
//
//                return false
//            } else {
//                self.wishListCatalog.append(hotel)
//                return true
//            }
//        }
        
        return cell
    }
    
    //  размер ячейки задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let offset: CGFloat = 20
        let screenWidth = UIScreen.main.bounds.size.width
        let cellWidth = screenWidth - offset * 2
        return CGSize(width: cellWidth, height: 218.14)
    }
    
    // отспут между ячейками задаем
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12.86
    }
    
    // отрабатываем нажатие на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let hotel = list?.data?.body?.searchResults?.results?[indexPath.row] else { return }
        let storyboard = UIStoryboard(name: "HotelDescription", bundle: nil)
        guard let destinationVC = storyboard.instantiateViewController(identifier: "HotelDescriptionViewController") as? HotelDescriptionViewController else { return }
        destinationVC.hotel = hotel
        navigationController?.pushViewController(destinationVC, animated: true)
//        show(destinationVC, sender: nil)
    }
}
