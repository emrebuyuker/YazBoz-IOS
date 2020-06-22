//
//  GalleryViewControllerCell.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 22.06.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import Foundation
import UIKit

class GalleryViewControllerCell: UICollectionViewCell {
	
	@IBOutlet weak var imageView: UIImageView!
	
	func galleryViewControllerCellMethod(image: String) {
		self.imageView.layer.borderColor = UIColor.black.cgColor
		self.imageView.layer.borderWidth = 2
		self.imageView.image = UIImage(named: image)
	}
}
