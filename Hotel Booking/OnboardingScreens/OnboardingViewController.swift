//
//  OnboardingViewController.swift
//  Hotel Booking
//
//  Created by Sergey on 5/14/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var onboarding: Onboarding = Onboarding()
    var onboardingPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    @IBAction func skipButtonPressed(_ sender: UIButton) {
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if onboardingPage != onboarding.pages.count {
            let indexPath = IndexPath(row: onboardingPage, section: 0)
            pageControl.currentPage = onboardingPage
// без нижней и через одну строку код не работает. Баг в XCod который давно не правят
            self.collectionView.isPagingEnabled = false
            self.collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
            self.collectionView.isPagingEnabled = true
            onboardingPage += 1
            
            if onboardingPage == 3 {
                skipButton.setTitle("Done", for: .normal)
                nextButton.setTitle("Get Started", for: .normal)
            }
        } else {
// конец экранов Onboarding. Переход на экран Register
            return
        }
    }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboarding.pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let page = onboarding.pages[indexPath.item]
        cell.setupCell(page: page)
        return cell
    }
    
// задаем размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 375 * 372)
    }
    
// убираем отступ между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
