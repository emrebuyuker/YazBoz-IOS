//
//  DetailOkeyPairedViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 9.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class DetailOkeyPairedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
	
	var skor1String: String!
	var skor2String: String!
	
	var row: Int?
	
	var isEdit: Bool = false
	var clickRow: Int = 0
	
	@IBOutlet weak var addButton: UIButton!
	
	@IBOutlet weak var player1: UITextField!
	@IBOutlet weak var player2: UITextField!
	
	@IBOutlet weak var skor1: UITextField!
	@IBOutlet weak var skor2: UITextField!
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var finishLabel: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		if (Variables.pairedOkeyPlayer1Text != nil) {
			self.player1.text = Variables.pairedOkeyPlayer1Text
		}
		
		if (Variables.pairedOkeyPlayer2Text != nil) {
			self.player2.text = Variables.pairedOkeyPlayer2Text
		}
		
		if (Variables.pairedOkeySkor1Int == nil) {
			Variables.pairedOkeySkor1Int = 0
		}
		
		if (Variables.pairedOkeySkor2Int == nil) {
			Variables.pairedOkeySkor2Int = 0
		}
		
		self.skor1.delegate = self
		self.skor2.delegate = self
		
		self.finishLabel.layer.borderWidth = 2
		self.finishLabel.layer.cornerRadius = 10
		self.finishLabel.layer.borderColor = UIColor.black.cgColor
		
		self.skor1.layer.borderWidth = 2
		self.skor2.layer.borderWidth = 2
		
		self.skor1.layer.cornerRadius = 10
		self.skor2.layer.cornerRadius = 10
		
		self.skor1.layer.borderColor = UIColor.black.cgColor
		self.skor2.layer.borderColor = UIColor.black.cgColor
		
		self.player1.layer.borderWidth = 2
		self.player2.layer.borderWidth = 2
		
		self.player1.layer.cornerRadius = 10
		self.player2.layer.cornerRadius = 10
		
		self.player1.layer.borderColor = UIColor.black.cgColor
		self.player2.layer.borderColor = UIColor.black.cgColor
	}
	
	@IBAction func skorAddButtonClick(_ sender: Any) {
		
		view.endEditing(true)
		
		if (isEdit) {
			self.isEdit = false
			self.addButton.setTitle("EKLE", for: .normal)
			
			Variables.pairedOkeySkor1IntArray[self.clickRow] = self.skor1.text!
			Variables.pairedOkeySkor2IntArray[self.clickRow] = self.skor2.text!
			
			Variables.pairedOkeySkor1Int = Variables.pairedOkeySkor1Int! + (Int(self.skor1.text!) ?? 0)
			Variables.pairedOkeySkor2Int = Variables.pairedOkeySkor2Int! + (Int(self.skor2.text!) ?? 0)
			
			self.skor1.text = ""
			self.skor2.text = ""
			
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
		
		Variables.pairedOkeyskorTotalInt = Int(self.finishLabel.text ?? "0")
		
		if (self.skor1.text!.count == 0 || self.skor2.text!.count == 0) {
			let alert = UIAlertController(title: "Error", message: "Lütfen boş skorları doldurunuz", preferredStyle: .alert)
			let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
				
			}
			alert.addAction(action)
			self.present(alert, animated: true, completion: nil)
			return
		}
		
		if ((self.skor1.text) == nil) {
			Variables.pairedOkeySkor1Int = ((Int((skor1String) ?? "0") ?? 0) + 0)
			self.skor1String = "\(String(describing: Variables.pairedOkeySkor1Int))"
			Variables.pairedOkeySkor1IntArray.append("0")
		}
		else {
			if let value = Int(self.skor1.text!) {
				Variables.pairedOkeySkor1Int = Variables.pairedOkeySkor1Int! + value
				Variables.pairedOkeySkor1IntArray.append(self.skor1.text!)
			}
		}
		
		if ((self.skor2.text) == nil) {
			Variables.pairedOkeySkor2Int = ((Int((skor2String) ?? "0") ?? 0) + 0)
			self.skor2String = "\(String(describing: Variables.pairedOkeySkor2Int))"
			Variables.pairedOkeySkor2IntArray.append("0")
		}
		else {
			if let value = Int(self.skor2.text!) {
				Variables.pairedOkeySkor2Int = Variables.pairedOkeySkor2Int! + value
				Variables.pairedOkeySkor2IntArray.append(self.skor2.text!)
			}
		}
		
		self.skor1.text = ""
		self.skor2.text = ""
		self.tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Variables.pairedOkeySkor1IntArray.count + 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if (Variables.pairedOkeySkor1IntArray.count == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TwoRowsTableViewCell
			cell.twoRowsTableViewCellMethod(row1: "0", row2: "0", index: "")
			return cell
		}
		
		if (indexPath.row == Variables.pairedOkeySkor1IntArray.count) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TwoRowsTableViewCell
			cell.twoRowsTableViewCellMethod(row1: "\(String(describing: Variables.pairedOkeyskorTotalInt - Variables.pairedOkeySkor1Int!))", row2: "\(String(describing: Variables.pairedOkeyskorTotalInt - Variables.pairedOkeySkor2Int!))", index: "T")
			
			if (Variables.pairedOkeyskorTotalInt - Variables.pairedOkeySkor1Int! <= 0 || Variables.pairedOkeyskorTotalInt - Variables.pairedOkeySkor2Int! <= 0) {
				performSegue(withIdentifier: "toResultOkeyPaired", sender: nil)
			}
			
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TwoRowsTableViewCell
			cell.twoRowsTableViewCellMethod(row1: Variables.pairedOkeySkor1IntArray[indexPath.row], row2: Variables.pairedOkeySkor2IntArray[indexPath.row], index: "\(indexPath.row + 1)")
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if (self.isEdit) {
			Variables.pairedOkeySkor1Int = Variables.pairedOkeySkor1Int! + (Int(self.skor1.text!) ?? 0)
			Variables.pairedOkeySkor2Int = Variables.pairedOkeySkor2Int! + (Int(self.skor2.text!) ?? 0)
		}
		
		self.isEdit = true
		if (indexPath.row == Variables.pairedOkeySkor1IntArray.count) {
			return
		}
		
		self.skor1.text = Variables.pairedOkeySkor1IntArray[indexPath.row]
		self.skor2.text = Variables.pairedOkeySkor2IntArray[indexPath.row]
		self.addButton.setTitle("DÜZENLE", for: .normal)
		
		Variables.pairedOkeySkor1Int = Variables.pairedOkeySkor1Int! - (Int(self.skor1.text!) ?? 0)
		Variables.pairedOkeySkor2Int = Variables.pairedOkeySkor2Int! - (Int(self.skor2.text!) ?? 0)
		
		self.clickRow = indexPath.row
	}
	
	@IBAction func deleteButtonClick(_ sender: Any) {
		
		let alert = UIAlertController(title: "Error", message: "Skorları temizlemek istediğinizden emin misiniz ?", preferredStyle: .alert)
		let actionOk = UIAlertAction(title: "EVET", style: .default) { (action:UIAlertAction) in
			Variables.pairedOkeySkor1IntArray.removeAll()
			Variables.pairedOkeySkor2IntArray.removeAll()
			Variables.pairedOkeyPlayer1Text = ""
			Variables.pairedOkeyPlayer2Text = ""
			self.tableView.reloadData()
		}
		
		let actionNo = UIAlertAction(title: "HAYIR", style: .default) { (action:UIAlertAction) in
			
		}
		alert.addAction(actionOk)
		alert.addAction(actionNo)
		self.present(alert, animated: true, completion: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		let resultVC = segue.destination as! ResultOkeyPairedViewController
		
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
		
		resultVC.skor1 = Variables.pairedOkeyskorTotalInt - Variables.pairedOkeySkor1Int!
		resultVC.skor2 = Variables.pairedOkeyskorTotalInt - Variables.pairedOkeySkor2Int!
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
