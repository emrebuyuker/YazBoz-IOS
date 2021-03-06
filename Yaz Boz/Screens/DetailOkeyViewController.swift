//
//  DetailOkeyViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 9.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class DetailOkeyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
	
	var skor1String: String!
	var skor2String: String!
	var skor3String: String!
	var skor4String: String!
	
	var skorTotalInt: Int!
	
	var row: Int?
	
	var skor1IntArray = [String]()
	var skor2IntArray = [String]()
	var skor3IntArray = [String]()
	var skor4IntArray = [String]()
	
	var isEdit: Bool = false
	var clickRow: Int = 0
	
	@IBOutlet weak var addButton: UIButton!
	
	@IBOutlet weak var player1: UITextField!
	@IBOutlet weak var player2: UITextField!
	@IBOutlet weak var player3: UITextField!
	@IBOutlet weak var player4: UITextField!
	
	@IBOutlet weak var skor1: UITextField!
	@IBOutlet weak var skor2: UITextField!
	@IBOutlet weak var skor3: UITextField!
	@IBOutlet weak var skor4: UITextField!
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var finishLabel: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		if (Variables.okeyPlayer1Text != nil) {
			self.player1.text = Variables.okeyPlayer1Text
		}
		
		if (Variables.okeyPlayer2Text != nil) {
			self.player2.text = Variables.okeyPlayer2Text
		}
		
		if (Variables.okeyPlayer3Text != nil) {
			self.player1.text = Variables.okeyPlayer3Text
		}
		
		if (Variables.okeyPlayer4Text != nil) {
			self.player2.text = Variables.okeyPlayer4Text
		}
		
		if (Variables.okeySkor1Int == nil) {
			Variables.okeySkor1Int = 0
		}
		
		if (Variables.okeySkor2Int == nil) {
			Variables.okeySkor2Int = 0
		}
		
		if (Variables.okeySkor3Int == nil) {
			Variables.okeySkor3Int = 0
		}
		
		if (Variables.okeySkor4Int == nil) {
			Variables.okeySkor4Int = 0
		}
		
		self.skor1.delegate = self
		self.skor2.delegate = self
		self.skor3.delegate = self
		self.skor4.delegate = self
		
		self.finishLabel.layer.borderWidth = 2
		self.finishLabel.layer.cornerRadius = 10
		self.finishLabel.layer.borderColor = UIColor.black.cgColor
		
		self.skor1.layer.borderWidth = 2
		self.skor2.layer.borderWidth = 2
		self.skor3.layer.borderWidth = 2
		self.skor4.layer.borderWidth = 2
		
		self.skor1.layer.cornerRadius = 10
		self.skor2.layer.cornerRadius = 10
		self.skor3.layer.cornerRadius = 10
		self.skor4.layer.cornerRadius = 10
		
		self.skor1.layer.borderColor = UIColor.black.cgColor
		self.skor2.layer.borderColor = UIColor.black.cgColor
		self.skor3.layer.borderColor = UIColor.black.cgColor
		self.skor4.layer.borderColor = UIColor.black.cgColor
		
		self.player1.layer.borderWidth = 2
		self.player2.layer.borderWidth = 2
		self.player3.layer.borderWidth = 2
		self.player4.layer.borderWidth = 2
		
		self.player1.layer.cornerRadius = 10
		self.player2.layer.cornerRadius = 10
		self.player3.layer.cornerRadius = 10
		self.player4.layer.cornerRadius = 10
		
		self.player1.layer.borderColor = UIColor.black.cgColor
		self.player2.layer.borderColor = UIColor.black.cgColor
		self.player3.layer.borderColor = UIColor.black.cgColor
		self.player4.layer.borderColor = UIColor.black.cgColor
	}
	
	@IBAction func skorAddButtonClick(_ sender: Any) {
		
		view.endEditing(true)
		
		if (isEdit) {
			self.isEdit = false
			self.addButton.setTitle("EKLE", for: .normal)
			
			Variables.okeySkor1IntArray[self.clickRow] = self.skor1.text!
			Variables.okeySkor2IntArray[self.clickRow] = self.skor2.text!
			Variables.okeySkor3IntArray[self.clickRow] = self.skor3.text!
			Variables.okeySkor4IntArray[self.clickRow] = self.skor4.text!
			
			Variables.okeySkor1Int = Variables.okeySkor1Int! + (Int(self.skor1.text!) ?? 0)
			Variables.okeySkor2Int = Variables.okeySkor2Int! + (Int(self.skor2.text!) ?? 0)
			Variables.okeySkor3Int = Variables.okeySkor3Int! + (Int(self.skor3.text!) ?? 0)
			Variables.okeySkor4Int = Variables.okeySkor4Int! + (Int(self.skor4.text!) ?? 0)
			
			self.skor1.text = ""
			self.skor2.text = ""
			self.skor3.text = ""
			self.skor4.text = ""
			
			self.tableView.reloadData()
			return
		}
		
		if (self.finishLabel.text!.count <= 0) {
			let alert = UIAlertController(title: "Error", message: "Lütfen kaçta bitsin alanını doldurunuz", preferredStyle: .alert)
			let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
				
			}
			alert.addAction(action)
			self.present(alert, animated: true, completion: nil)
			return
		}
		
		self.skorTotalInt = Int(self.finishLabel.text ?? "0")
		
		if (self.skor1.text!.count == 0 || self.skor2.text!.count == 0 || self.skor3.text!.count == 0 || self.skor4.text!.count == 0) {
			let alert = UIAlertController(title: "Error", message: "Lütfen boş skorları doldurunuz", preferredStyle: .alert)
			let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
				
			}
			alert.addAction(action)
			self.present(alert, animated: true, completion: nil)
			return
		}
		
		if ((self.skor1.text) == nil) {
			Variables.okeySkor1Int = ((Int((skor1String) ?? "0") ?? 0) + 0)
			self.skor1String = "\(String(describing: Variables.okeySkor1Int))"
			Variables.okeySkor1IntArray.append("0")
		}
		else {
			if let value = Int(self.skor1.text!) {
				Variables.okeySkor1Int = Variables.okeySkor1Int! + value
				Variables.okeySkor1IntArray.append(self.skor1.text!)
			}
		}
		
		if ((self.skor2.text) == nil) {
			Variables.okeySkor2Int = ((Int((skor2String) ?? "0") ?? 0) + 0)
			self.skor2String = "\(String(describing: Variables.okeySkor2Int))"
			Variables.okeySkor2IntArray.append("0")
		}
		else {
			if let value = Int(self.skor2.text!) {
				Variables.okeySkor2Int = Variables.okeySkor2Int! + value
				Variables.okeySkor2IntArray.append(self.skor2.text!)
			}
		}
		
		if ((self.skor3.text) == nil) {
			Variables.okeySkor3Int = ((Int((skor3String) ?? "0") ?? 0) + 0)
			self.skor3String = "\(String(describing: Variables.okeySkor3Int))"
			Variables.okeySkor3IntArray.append("0")
		}
		else {
			if let value = Int(self.skor3.text!) {
				Variables.okeySkor3Int = Variables.okeySkor3Int! + value
				Variables.okeySkor3IntArray.append(self.skor3.text!)
			}
		}
		
		if ((self.skor4.text) == nil) {
			Variables.okeySkor4Int = ((Int((skor4String) ?? "0") ?? 0) + 0)
			self.skor4String = "\(String(describing: Variables.okeySkor4Int))"
			Variables.okeySkor4IntArray.append("0")
		}
		else {
			if let value = Int(self.skor4.text!) {
				Variables.okeySkor4Int = Variables.okeySkor4Int! + value
				Variables.okeySkor4IntArray.append(self.skor4.text!)
			}
		}
		
		self.skor1.text = ""
		self.skor2.text = ""
		self.skor3.text = ""
		self.skor4.text = ""
		self.tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Variables.okeySkor1IntArray.count + 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if (Variables.okeySkor1IntArray.count == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FourRowsTableViewCell
			cell.fourRowsTableViewCellMethod(row1: "0", row2: "0", row3: "0", row4: "0", index: "")
			return cell
		}
		
		if (indexPath.row == Variables.okeySkor1IntArray.count) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FourRowsTableViewCell
			cell.fourRowsTableViewCellMethod(row1: "\(String(describing: self.skorTotalInt - Variables.okeySkor1Int!))",
				row2: "\(String(describing: self.skorTotalInt - Variables.okeySkor2Int!))",
				row3: "\(String(describing: self.skorTotalInt - Variables.okeySkor3Int!))",
				row4: "\(String(describing: self.skorTotalInt - Variables.okeySkor4Int!))",
				index: "T")
			
			if (self.skorTotalInt - Variables.okeySkor1Int! <= 0 || self.skorTotalInt - Variables.okeySkor2Int! <= 0 || self.skorTotalInt - Variables.okeySkor3Int! <= 0 || self.skorTotalInt - Variables.okeySkor4Int! <= 0) {
				performSegue(withIdentifier: "toResultOkey", sender: nil)
			}
			
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FourRowsTableViewCell
			cell.fourRowsTableViewCellMethod(row1: Variables.okeySkor1IntArray[indexPath.row], row2: Variables.okeySkor2IntArray[indexPath.row], row3: Variables.okeySkor3IntArray[indexPath.row], row4: Variables.okeySkor4IntArray[indexPath.row], index: "\(indexPath.row + 1)")
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if (self.isEdit) {
			Variables.okeySkor1Int = Variables.okeySkor1Int! + (Int(self.skor1.text!) ?? 0)
			Variables.okeySkor2Int = Variables.okeySkor2Int! + (Int(self.skor2.text!) ?? 0)
			Variables.okeySkor3Int = Variables.okeySkor3Int! + (Int(self.skor3.text!) ?? 0)
			Variables.okeySkor4Int = Variables.okeySkor4Int! + (Int(self.skor4.text!) ?? 0)
		}
		
		self.isEdit = true
		if (indexPath.row == skor1IntArray.count) {
			return
		}
		
		self.skor1.text = Variables.okeySkor1IntArray[indexPath.row]
		self.skor2.text = Variables.okeySkor2IntArray[indexPath.row]
		self.skor3.text = Variables.okeySkor3IntArray[indexPath.row]
		self.skor4.text = Variables.okeySkor4IntArray[indexPath.row]
		self.addButton.setTitle("DÜZENLE", for: .normal)
		
		Variables.okeySkor1Int = Variables.okeySkor1Int! - (Int(self.skor1.text!) ?? 0)
		Variables.okeySkor2Int = Variables.okeySkor2Int! - (Int(self.skor2.text!) ?? 0)
		Variables.okeySkor3Int = Variables.okeySkor3Int! - (Int(self.skor3.text!) ?? 0)
		Variables.okeySkor4Int = Variables.okeySkor4Int! - (Int(self.skor4.text!) ?? 0)
		
		self.clickRow = indexPath.row
	}
	
	@IBAction func deleteButtonClick(_ sender: Any) {
		
		let alert = UIAlertController(title: "Error", message: "Skorları temizlemek istediğinizden emin misiniz ?", preferredStyle: .alert)
		let actionOk = UIAlertAction(title: "EVET", style: .default) { (action:UIAlertAction) in
			Variables.okeySkor1IntArray.removeAll()
			Variables.okeySkor2IntArray.removeAll()
			Variables.okeySkor3IntArray.removeAll()
			Variables.okeySkor4IntArray.removeAll()
			Variables.okeyPlayer1Text = ""
			Variables.okeyPlayer2Text = ""
			Variables.okeyPlayer3Text = ""
			Variables.okeyPlayer4Text = ""
			self.tableView.reloadData()
		}
		
		let actionNo = UIAlertAction(title: "HAYIR", style: .default) { (action:UIAlertAction) in
			
		}
		alert.addAction(actionOk)
		alert.addAction(actionNo)
		self.present(alert, animated: true, completion: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		let resultVC = segue.destination as! ResultOkeyViewController
		
		if (self.player1.text?.count == 0) {
			resultVC.player1 = "Oyuncu1"
		} else {
			resultVC.player1 = self.player1.text!
		}

		if (self.player2.text?.count == 0) {
			resultVC.player2 = "Oyuncu2"
		} else {
			resultVC.player2 = self.player2.text!
		}

		if (self.player3.text?.count == 0) {
			resultVC.player3 = "Oyuncu3"
		} else {
			resultVC.player3 = self.player3.text!
		}

		if (self.player4.text?.count == 0) {
			resultVC.player4 = "Oyuncu4"
		} else {
			resultVC.player4 = self.player4.text!
		}

		resultVC.skor1 = self.skorTotalInt - Variables.okeySkor1Int!
		resultVC.skor2 = self.skorTotalInt - Variables.okeySkor2Int!
		resultVC.skor3 = self.skorTotalInt - Variables.okeySkor3Int!
		resultVC.skor4 = self.skorTotalInt - Variables.okeySkor4Int!
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if (range.location == 0 && range.length == 0) {
			let allowedCharacters = CharacterSet(charactersIn: "0123456789-")
			let characterSet = CharacterSet(charactersIn: string)
			return allowedCharacters.isSuperset(of: characterSet)
		} else {
			let allowedCharacters = CharacterSet(charactersIn: "0123456789")
			let characterSet = CharacterSet(charactersIn: string)
			return allowedCharacters.isSuperset(of: characterSet)
		}
	}
}
