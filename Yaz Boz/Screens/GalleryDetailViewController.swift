//
//  GalleryDetailViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 22.06.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class GalleryDetailViewController: UIViewController {
	
	var image: String = ""

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var closedButton: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.imageView.image = UIImage(named: image)
		self.closedButton.layer.cornerRadius = 8
    }
	
	@IBAction func closedButtonClick(_ sender: Any) {
		self.dismiss(animated: true)
	}
}
