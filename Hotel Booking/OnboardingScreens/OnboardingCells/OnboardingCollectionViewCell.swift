//
//  OnboardingCollectionViewCell.swift
//  Hotel Booking
//
//  Created by Sergey on 5/14/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pageImage: UIImageView!
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var pageText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(page: Page) {
        self.pageImage.image = page.image
        self.pageTitle.text = page.title
        self.pageText.text = page.text
    }

}
