//
//  WelcomeViewController.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 22/12/22.
//

import UIKit

//https://stackoverflow.com/questions/59169742/swift-5-collection-view-layout-of-cell-and-all-the-items-inside-the-cell
class WelcomeViewController: UIViewController {
    // CollectionView variable:
    var collectionViewMenu: UICollectionView?
    var labelTitle: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupCollection()
        setupLabel()
        setupLabelPosts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionViewMenu?.frame = view.bounds
    }
    
    func setupLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        label.center = CGPoint(x: view.frame.size.width/2, y: 80)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Discovery"
        
        self.view.addSubview(label)
    }
    
    func setupLabelPosts() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        label.center = CGPoint(x: view.frame.size.width/2, y: 80)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "RECENT POSTS"
        
        self.view.addSubview(label)
    }
    
    func setupCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 150, left: 20, bottom: 20, right: 20)
        collectionViewMenu = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionViewMenu?.dataSource = self
        collectionViewMenu?.delegate = self
        collectionViewMenu?.register(MenuCollectionViewCell.nib(), forCellWithReuseIdentifier: MenuCollectionViewCell.reuseIdentifier)
        collectionViewMenu?.backgroundColor = .lightGray
        view.addSubview(collectionViewMenu!)
    }
}

// MARK: - UICollectionViewDelegate
extension WelcomeViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDataSource
extension WelcomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return discovery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier, for: indexPath) as? MenuCollectionViewCell {
            
            let discove = discovery[indexPath.row]
            cell.setupCell(title: discove.name, image: discove.image)
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WelcomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2.4, height: view.frame.size.width/2.4)
    }
}
