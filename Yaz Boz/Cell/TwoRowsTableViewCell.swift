//
//  TwoRowsTableViewCell.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 8.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class TwoRowsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var row1Label: UILabel!
	@IBOutlet weak var row2Label: UILabel!
	
	@IBOutlet weak var indexLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func twoRowsTableViewCellMethod (row1: String, row2: String, index: String) {
		self.row1Label.text = row1
		self.row2Label.text = row2
		self.indexLabel.text = index
	}
}
