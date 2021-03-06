//
//  ResultOkeyViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 14.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class ResultOkeyViewController: UIViewController {
	
	var player1 = String()
    var player2 = String()
    var player3 = String()
    var player4 = String()
	
	var skor1: Int!
	var skor2: Int!
	var skor3: Int!
	var skor4: Int!
	
	@IBOutlet weak var player1Label: UILabel!
	@IBOutlet weak var player2Label: UILabel!
	@IBOutlet weak var player3Label: UILabel!
	@IBOutlet weak var player4Label: UILabel!
	
	@IBOutlet weak var skor1Label: UILabel!
	@IBOutlet weak var skor2Label: UILabel!
	@IBOutlet weak var skor3Label: UILabel!
	@IBOutlet weak var skor4Label: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.player1Label.text = self.player1
		self.player2Label.text = self.player2
		self.player3Label.text = self.player3
		self.player4Label.text = self.player4
		
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
		
		if (self.skor3 == nil) {
			self.skor3Label.text = "0"
		} else {
			self.skor3Label.text = "\(String(describing: self.skor3!))"
		}
		
		if (self.skor4 == nil) {
			self.skor4Label.text = "0"
		} else {
			self.skor4Label.text = "\(String(describing: self.skor4!))"
		}
    }
}
