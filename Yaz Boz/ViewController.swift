//
//  ViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 7.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		VersionCheck.shared.checkAppStore() { isNew, version in
			print("IS NEW VERSION AVAILABLE: \(String(describing: isNew)), APP STORE VERSION: \(String(describing: version))")
			if (!(isNew ?? false)) {
				let alert = UIAlertController(title: "Error", message: "Uygulama en güncel sürüme sahip değil lütfen uygulamayı güncelleyiniz.", preferredStyle: .alert)
				self.present(alert, animated: true)
			}
		}
	}
	
	@IBAction func button101Click(_ sender: Any) {
	}
}

