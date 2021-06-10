//
//  DataModel.swift
//  OneBancAssignment
//
//  Created by Anmol Kalra on 09/06/21.
//

import Foundation

struct DataModel: Decodable {
	let transactions: [Reply]
}

struct Reply: Decodable {
	let startDate: String
	let amount: Int
	let description: String
	let status: Int
	let direction: Int
}
