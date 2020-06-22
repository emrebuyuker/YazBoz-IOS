//
//  HomeViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 22.06.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
	
	@IBOutlet weak var menuButton: UIButton!
	@IBOutlet weak var galleryButton: UIButton!
	@IBOutlet weak var yazBozButton: UIButton!
	@IBOutlet weak var mapIcon: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		VersionCheck.shared.checkAppStore() { isNew, version in
			print("IS NEW VERSION AVAILABLE: \(String(describing: isNew)), APP STORE VERSION: \(String(describing: version))")
			if (!(isNew ?? false)) {
				let alert = UIAlertController(title: "Error", message: "Uygulama en güncel sürüme sahip değil lütfen uygulamayı güncelleyiniz.", preferredStyle: .alert)
				self.present(alert, animated: true)
			}
		}
		
		self.menuButton.backgroundColor = UIColor.clear
		self.menuButton.layer.borderColor = UIColor(red: 254/255, green: 232/255, blue: 156/255, alpha: 1).cgColor
		self.menuButton.layer.borderWidth = 2
		self.menuButton.layer.cornerRadius = 8
		
		self.galleryButton.backgroundColor = UIColor.clear
		self.galleryButton.layer.borderColor = UIColor(red: 254/255, green: 232/255, blue: 156/255, alpha: 1).cgColor
		self.galleryButton.layer.borderWidth = 2
		self.galleryButton.layer.cornerRadius = 8
		
		self.yazBozButton.backgroundColor = UIColor.clear
		self.yazBozButton.layer.borderColor = UIColor(red: 254/255, green: 232/255, blue: 156/255, alpha: 1).cgColor
		self.yazBozButton.layer.borderWidth = 2
		self.yazBozButton.layer.cornerRadius = 8
		
		self.mapIcon.backgroundColor = UIColor.clear
		self.mapIcon.layer.borderColor = UIColor(red: 254/255, green: 232/255, blue: 156/255, alpha: 1).cgColor
		self.mapIcon.layer.borderWidth = 4
		self.mapIcon.layer.cornerRadius = 16
    }
	
	func openMapsAppWithDirections(to coordinate: CLLocationCoordinate2D, destinationName name: String) {
	  let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking]
	  let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
	  let mapItem = MKMapItem(placemark: placemark)
	  mapItem.name = name
		mapItem.openInMaps(launchOptions: options)
	}
	
	@IBAction func openMapMethod(_ sender: Any) {
		let locValue: CLLocationCoordinate2D = CLLocationCoordinate2DMake(39.823452, 34.810947)
		self.openMapsAppWithDirections(to: locValue, destinationName: "Kupa Kafe")
	}
}
