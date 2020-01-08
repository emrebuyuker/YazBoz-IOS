//
//  FourRowsTableViewCell.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 7.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class FourRowsTableViewCell: UITableViewCell {

	@IBOutlet weak var row1Label: UILabel!
	@IBOutlet weak var row2Label: UILabel!
	@IBOutlet weak var row3Label: UILabel!
	@IBOutlet weak var row4Label: UILabel!
	
	@IBOutlet weak var indexLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	func fourRowsTableViewCellMethod (row1: String, row2: String, row3: String, row4: String, index: String) {
		self.row1Label.text = row1
		self.row2Label.text = row2
		self.row3Label.text = row3
		self.row4Label.text = row4
		self.indexLabel.text = index
	}
}
