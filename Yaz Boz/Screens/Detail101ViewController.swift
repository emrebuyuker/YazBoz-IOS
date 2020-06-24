//
//  Detail101ViewController.swift
//  Yaz Boz
//
//  Created by Emre BÜYÜKER on 7.01.2020.
//  Copyright © 2020 Emre BÜYÜKER. All rights reserved.
//

import UIKit

class Detail101ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
	
	var skor1String: String!
	var skor2String: String!
	var skor3String: String!
	var skor4String: String!
	
	var row: Int?
	
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
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		if (Variables.okey101Player1Text != nil) {
			self.player1.text = Variables.okey101Player1Text
		}
		
		if (Variables.okey101Player2Text != nil) {
			self.player2.text = Variables.okey101Player2Text
		}
		
		if (Variables.okey101Player3Text != nil) {
			self.player3.text = Variables.okey101Player3Text
		}
		
		if (Variables.okey101Player4Text != nil) {
			self.player4.text = Variables.okey101Player4Text
		}
		
		if (Variables.okey101Skor1Int == nil) {
			Variables.okey101Skor1Int = 0
		}
		
		if (Variables.okey101Skor2Int == nil) {
			Variables.okey101Skor2Int = 0
		}
		
		if (Variables.okey101Skor3Int == nil) {
			Variables.okey101Skor3Int = 0
		}
		
		if (Variables.okey101Skor4Int == nil) {
			Variables.okey101Skor4Int = 0
		}
		
		self.skor1.delegate = self
		self.skor2.delegate = self
		self.skor3.delegate = self
		self.skor4.delegate = self
		
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
		
		Variables.okey101Player1Text = self.player1.text
		Variables.okey101Player2Text = self.player2.text
		Variables.okey101Player3Text = self.player3.text
		Variables.okey101Player4Text = self.player4.text
		
		if (isEdit) {
			self.isEdit = false
			self.addButton.setTitle("EKLE", for: .normal)
			
			Variables.okey101Skor1IntArray[self.clickRow] = self.skor1.text!
			Variables.okey101Skor2IntArray[self.clickRow] = self.skor2.text!
			Variables.okey101Skor3IntArray[self.clickRow] = self.skor3.text!
			Variables.okey101Skor4IntArray[self.clickRow] = self.skor4.text!
			
			Variables.okey101Skor1Int = Variables.okey101Skor1Int! + (Int(self.skor1.text!) ?? 0)
			Variables.okey101Skor2Int = Variables.okey101Skor2Int! + (Int(self.skor2.text!) ?? 0)
			Variables.okey101Skor3Int = Variables.okey101Skor3Int! + (Int(self.skor3.text!) ?? 0)
			Variables.okey101Skor4Int = Variables.okey101Skor4Int! + (Int(self.skor4.text!) ?? 0)
			
			self.skor1.text = ""
			self.skor2.text = ""
			self.skor3.text = ""
			self.skor4.text = ""
			
			self.tableView.reloadData()
			return
		}
		
		if (self.skor1.text!.count == 0 || self.skor2.text!.count == 0 || self.skor3.text!.count == 0 || self.skor4.text!.count == 0) {
			let alert = UIAlertController(title: "Error", message: "Lütfen boş skorları doldurunuz", preferredStyle: .alert)
			let action = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
				
			}
			alert.addAction(action)
			self.present(alert, animated: true, completion: nil)
			return
		}
		
		if ((self.skor1.text) == nil) {
			Variables.okey101Skor1Int = ((Int((skor1String) ?? "0") ?? 0) + 0)
			self.skor1String = "\(String(describing: Variables.okey101Skor1Int))"
			Variables.okey101Skor1IntArray.append("0")
		}
		else {
			if let value = Int(self.skor1.text!) {
				Variables.okey101Skor1Int = Variables.okey101Skor1Int! + value
				Variables.okey101Skor1IntArray.append(self.skor1.text!)
			}
		}
		
		if ((self.skor2.text) == nil) {
			Variables.okey101Skor2Int = ((Int((skor2String) ?? "0") ?? 0) + 0)
			self.skor2String = "\(String(describing: Variables.okey101Skor2Int))"
			Variables.okey101Skor2IntArray.append("0")
		}
		else {
			if let value = Int(self.skor2.text!) {
				Variables.okey101Skor2Int = Variables.okey101Skor2Int! + value
				Variables.okey101Skor2IntArray.append(self.skor2.text!)
			}
		}
		
		if ((self.skor3.text) == nil) {
			Variables.okey101Skor3Int = ((Int((skor3String) ?? "0") ?? 0) + 0)
			self.skor3String = "\(String(describing: Variables.okey101Skor3Int))"
			Variables.okey101Skor3IntArray.append("0")
		}
		else {
			if let value = Int(self.skor3.text!) {
				Variables.okey101Skor3Int = Variables.okey101Skor3Int! + value
				Variables.okey101Skor3IntArray.append(self.skor3.text!)
			}
		}
		
		if ((self.skor4.text) == nil) {
			Variables.okey101Skor4Int = ((Int((skor4String) ?? "0") ?? 0) + 0)
			self.skor4String = "\(String(describing: Variables.okey101Skor4Int))"
			Variables.okey101Skor4IntArray.append("0")
		}
		else {
			if let value = Int(self.skor4.text!) {
				Variables.okey101Skor4Int = Variables.okey101Skor4Int! + value
				Variables.okey101Skor4IntArray.append(self.skor4.text!)
			}
		}
		
		self.skor1.text = ""
		self.skor2.text = ""
		self.skor3.text = ""
		self.skor4.text = ""
		self.tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Variables.okey101Skor1IntArray.count + 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if (Variables.okey101Skor1IntArray.count == 0) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FourRowsTableViewCell
			cell.fourRowsTableViewCellMethod(row1: "0", row2: "0", row3: "0", row4: "0", index: "")
			return cell
		}
			
		if (indexPath.row == Variables.okey101Skor1IntArray.count) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FourRowsTableViewCell
			cell.fourRowsTableViewCellMethod(row1: "\(String(describing: Variables.okey101Skor1Int!))", row2: "\(String(describing: Variables.okey101Skor2Int!))", row3: "\(String(describing: Variables.okey101Skor3Int!))", row4: "\(String(describing: Variables.okey101Skor4Int!))", index: "T")
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FourRowsTableViewCell
			cell.fourRowsTableViewCellMethod(row1: Variables.okey101Skor1IntArray[indexPath.row], row2: Variables.okey101Skor2IntArray[indexPath.row], row3: Variables.okey101Skor3IntArray[indexPath.row], row4: Variables.okey101Skor4IntArray[indexPath.row], index: "\(indexPath.row + 1)")
			return cell
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		if (self.isEdit) {
			Variables.okey101Skor1Int = Variables.okey101Skor1Int! + (Int(self.skor1.text!) ?? 0)
			Variables.okey101Skor2Int = Variables.okey101Skor2Int! + (Int(self.skor2.text!) ?? 0)
			Variables.okey101Skor3Int = Variables.okey101Skor3Int! + (Int(self.skor3.text!) ?? 0)
			Variables.okey101Skor4Int = Variables.okey101Skor4Int! + (Int(self.skor4.text!) ?? 0)
		}
		
		self.isEdit = true
		if (indexPath.row == Variables.okey101Skor1IntArray.count) {
			return
		}
		
		self.skor1.text = Variables.okey101Skor1IntArray[indexPath.row]
		self.skor2.text = Variables.okey101Skor2IntArray[indexPath.row]
		self.skor3.text = Variables.okey101Skor3IntArray[indexPath.row]
		self.skor4.text = Variables.okey101Skor4IntArray[indexPath.row]
		self.addButton.setTitle("DÜZENLE", for: .normal)
		
		Variables.okey101Skor1Int = Variables.okey101Skor1Int! - (Int(self.skor1.text!) ?? 0)
		Variables.okey101Skor2Int = Variables.okey101Skor2Int! - (Int(self.skor2.text!) ?? 0)
		Variables.okey101Skor3Int = Variables.okey101Skor3Int! - (Int(self.skor3.text!) ?? 0)
		Variables.okey101Skor4Int = Variables.okey101Skor4Int! - (Int(self.skor4.text!) ?? 0)
		
		self.clickRow = indexPath.row
	}
	
	@IBAction func deleteButtonClick(_ sender: Any) {
		
		let alert = UIAlertController(title: "Error", message: "Skorları temizlemek istediğinizden emin misiniz ?", preferredStyle: .alert)
		let actionOk = UIAlertAction(title: "EVET", style: .default) { (action:UIAlertAction) in
			Variables.okey101Skor1IntArray.removeAll()
			Variables.okey101Skor2IntArray.removeAll()
			Variables.okey101Skor3IntArray.removeAll()
			Variables.okey101Skor4IntArray.removeAll()
			Variables.okey101Player1Text = ""
			Variables.okey101Player2Text = ""
			Variables.okey101Player3Text = ""
			Variables.okey101Player4Text = ""
			self.tableView.reloadData()
		}
		
		let actionNo = UIAlertAction(title: "HAYIR", style: .default) { (action:UIAlertAction) in
			
		}
		alert.addAction(actionOk)
		alert.addAction(actionNo)
		self.present(alert, animated: true, completion: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		let resultVC = segue.destination as! Result101ViewController
		
		if (self.player1.text?.count == 0) {
			resultVC.player1 = "Oyuncu1"
		} else {
			resultVC.player1 = Variables.okey101Player1Text!
		}
		
		if (self.player2.text?.count == 0) {
			resultVC.player2 = "Oyuncu2"
		} else {
			resultVC.player2 = Variables.okey101Player2Text!
		}
		
		if (self.player3.text?.count == 0) {
			resultVC.player3 = "Oyuncu3"
		} else {
			resultVC.player3 = Variables.okey101Player3Text!
		}
		
		if (self.player4.text?.count == 0) {
			resultVC.player4 = "Oyuncu4"
		} else {
			resultVC.player4 = Variables.okey101Player4Text!
		}
		
		resultVC.skor1 = Variables.okey101Skor1Int
		resultVC.skor2 = Variables.okey101Skor2Int
		resultVC.skor3 = Variables.okey101Skor3Int
		resultVC.skor4 = Variables.okey101Skor4Int
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
