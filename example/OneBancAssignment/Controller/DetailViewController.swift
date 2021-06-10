//
//  DetailViewController.swift
//  OneBancAssignment
//
//  Created by Anmol Kalra on 09/06/21.
//

import UIKit

class DetailViewController: UITableViewController {
	
	let K = Constants()
	let dataManager = DataManager()
	var data = [Reply]() {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
	let string = "https://dev.onebanc.ai//assignment.asmx/GetTransactionHistory?userId=1&recipientId=2"
	
	var name: String?
	
	override func viewWillAppear(_ animated: Bool) {
		navigationItem.largeTitleDisplayMode = .never
		dataManager.getData(for: URL(string: string)!) { response in
			self.data = response
		}
		title = name
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.rowHeight = 110
		tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Detail")
	}
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Detail", for: indexPath) as! CustomCell
		cell.accessoryType = .disclosureIndicator
		
		if data[indexPath.row].direction == 1 {
			cell.directionLabel.text = K.direction1
			cell.directionLabel.textColor = #colorLiteral(red: 0.7757664895, green: 0.1121165996, blue: 0.1079642367, alpha: 1)

		} else if data[indexPath.row].direction == 2 {
			cell.directionLabel.text = K.direction2
			cell.directionLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

		}
		
		cell.amount.text = String(data[indexPath.row].amount)
		cell.dateLabel.text = String(data[indexPath.row].startDate)
		cell.transactionNumber.text = randomString(length: 14)
		
		switch data[indexPath.row].status {
		case 1:
			cell.statusImage.image = UIImage(systemName: "info.circle.fill")
			cell.statusImage.tintColor = .gray
			cell.paymentStatus.text = K.status1
		case 2:
			cell.statusImage.image = UIImage(systemName: "checkmark.seal.fill")
			cell.statusImage.tintColor = .green
			cell.paymentStatus.text = K.status2
		case 3:
			cell.statusImage.image = UIImage(systemName: "xmark.circle")
			cell.statusImage.tintColor = .yellow
			cell.paymentStatus.text = K.status3
		case 4:
			cell.statusImage.image = UIImage(systemName: "xmark.circle.fill")
			cell.statusImage.tintColor = .red
			cell.paymentStatus.text = K.status4
		case 5:
			cell.statusImage.image = UIImage(systemName: "xmark")
			cell.statusImage.tintColor = .orange
			cell.paymentStatus.text = K.status5
		default:
			print("default case")
		}
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func randomString(length: Int) -> String {
	  let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	  return String((0..<length).map{ _ in letters.randomElement()! })
	}
}
