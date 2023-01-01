//
//  HomeViewController.swift
//  Protector-App
//
//  Created by Marcylene Barreto on 29/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var menuCollection: UICollectionView?
    @IBOutlet weak var postsCollection: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuCollection()
        setupPostsCollection()
    }
    
    func setupMenuCollection() {
        menuCollection?.dataSource = self
        menuCollection?.delegate = self
        menuCollection?.register(MenuCollectionViewCell.nib(), forCellWithReuseIdentifier: MenuCollectionViewCell.reuseIdentifier)
    }
    
    func setupPostsCollection() {
        postsCollection?.dataSource = self
        postsCollection?.delegate = self
        postsCollection?.register(PostsCollectionViewCell.nib(), forCellWithReuseIdentifier: PostsCollectionViewCell.reuseIdentifier)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuCollection {
            return discovery.count
        } else {
            return postsData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuCollection {
            let cellMenu = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier, for: indexPath) as! MenuCollectionViewCell
            
            let discove = discovery[indexPath.row]
            cellMenu.setupCell(title: discove.name, image: discove.image)
            return cellMenu
        } else {
            let cellPost = collectionView.dequeueReusableCell(withReuseIdentifier: PostsCollectionViewCell.reuseIdentifier, for: indexPath) as! PostsCollectionViewCell
            
            let post = postsData[indexPath.row]
            cellPost.imgNotice.image = post.image
            cellPost.categoryLabel.text = post.category
            cellPost.resumeNotice.text = post.resume
            cellPost.releaseData.text = post.data
            return cellPost
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/2.4, height: view.frame.size.width/2.4)
    }
}
