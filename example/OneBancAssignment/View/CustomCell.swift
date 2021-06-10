//
//  CustomCell.swift
//  OneBancAssignment
//
//  Created by Anmol Kalra on 10/06/21.
//

import UIKit

class CustomCell: UITableViewCell {

	@IBOutlet var amount: UILabel!
	@IBOutlet var transactionNumber: UILabel!
	@IBOutlet var dateLabel: UILabel!
	@IBOutlet var statusImage: UIImageView!
	@IBOutlet var paymentStatus: UILabel!
	@IBOutlet var directionLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
