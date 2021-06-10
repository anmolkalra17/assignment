//
//  ViewController.swift
//  OneBancAssignment
//
//  Created by Anmol Kalra on 09/06/21.
//

import UIKit

class ViewController: UITableViewController {

	let data = ["John Doe"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Home", for: indexPath)
		cell.accessoryType = .disclosureIndicator
		cell.textLabel?.text = data[indexPath.row]
		cell.imageView?.image = UIImage(systemName: "person")
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		guard let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController else { fatalError("could not initialise detail") }
		vc.name = data[indexPath.row]
		navigationController?.pushViewController(vc, animated: 	true)
	}
}
