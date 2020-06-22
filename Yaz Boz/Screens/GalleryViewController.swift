//
//  GalleryViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 22.06.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
    }
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GalleryViewControllerCell
		cell?.galleryViewControllerCellMethod(image: "image\(indexPath.row)")
		return cell!
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let galleryDetailViewController = GalleryDetailViewController(nibName: "GalleryDetailViewController", bundle: nil)
		galleryDetailViewController.modalPresentationStyle = .fullScreen
		galleryDetailViewController.image = "image\(indexPath.row)"
		self.present(galleryDetailViewController, animated:true, completion:nil)
	}
}
