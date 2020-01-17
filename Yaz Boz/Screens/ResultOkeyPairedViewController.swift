//
//  ResultOkeyPairedViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 14.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class ResultOkeyPairedViewController: UIViewController {
	
	var player1 = String()
    var player2 = String()
	
	var skor1: Int!
	var skor2: Int!
	
	@IBOutlet weak var player1Label: UILabel!
	@IBOutlet weak var player2Label: UILabel!
	
	@IBOutlet weak var skor1Label: UILabel!
	@IBOutlet weak var skor2Label: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.player1Label.text = self.player1
		self.player2Label.text = self.player2
		
		if (self.skor1 == nil) {
			self.skor1Label.text = "0"
		} else {
			self.skor1Label.text = "\(String(describing: self.skor1!))"
		}
		
		if (self.skor2 == nil) {
			self.skor2Label.text = "0"
		} else {
			self.skor2Label.text = "\(String(describing: self.skor2!))"
		}
    }
}
