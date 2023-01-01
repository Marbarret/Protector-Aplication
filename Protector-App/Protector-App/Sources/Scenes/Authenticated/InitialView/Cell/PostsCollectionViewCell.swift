//
//  PostsCollectionViewCell.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 29/12/22.
//

import UIKit

class PostsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundCell: UIView!
    @IBOutlet weak var imgNotice: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var resumeNotice: UILabel!
    @IBOutlet weak var releaseData: UILabel!
    
    static let reuseIdentifier: String = "PostsCollectionViewCell"
    static let nibName = "PostsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func nib() -> UINib {
        return UINib(nibName: nibName,
                     bundle: nil)
    }
}
