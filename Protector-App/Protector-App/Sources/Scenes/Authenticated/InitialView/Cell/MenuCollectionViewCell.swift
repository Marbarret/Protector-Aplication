//
//  MenuCollectionViewCell.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 22/12/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier: String = "MenuCollectionViewCell"
    static let nibName = "MenuCollectionViewCell"
    
    @IBOutlet weak var imgMenu: UIImageView!
    @IBOutlet weak var titleMenu: UILabel!
    @IBOutlet weak var customView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(title: String, image: UIImage?) {
        self.titleMenu.text = title
        self.imgMenu.image = image
    }
    
    class func nib() -> UINib {
        return UINib(nibName: nibName,
                     bundle: nil)
    }
}
