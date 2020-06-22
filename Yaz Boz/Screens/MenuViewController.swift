//
//  MenuViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 22.06.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIScrollViewDelegate {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var scrollImg: UIScrollView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let vWidth = self.view.frame.width
		let vHeight = self.view.frame.height
		
		scrollImg.delegate = self
		scrollImg.frame = CGRect(x: 0, y: 0, width: vWidth, height: vHeight)
		scrollImg.backgroundColor = UIColor(red: 90, green: 90, blue: 90, alpha: 0.90)
		scrollImg.alwaysBounceVertical = false
		scrollImg.alwaysBounceHorizontal = false
		scrollImg.showsVerticalScrollIndicator = true
		scrollImg.flashScrollIndicators()
		
		scrollImg.minimumZoomScale = 1.0
		scrollImg.maximumZoomScale = 10.0
		
		imageView!.layer.cornerRadius = 11.0
		imageView!.clipsToBounds = false
		scrollImg.addSubview(imageView!)
    }
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return self.imageView
	}
}
