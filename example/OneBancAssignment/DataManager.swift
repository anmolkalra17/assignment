//
//  DataManager.swift
//  OneBancAssignment
//
//  Created by Anmol Kalra on 09/06/21.
//

import Foundation

class DataManager {
	
	
	func getData(for string: URL, completion: @escaping ([Reply]) -> Void) {
		var mainData = [Reply]()
		let session = URLSession.shared
		let task = session.dataTask(with: string) { data, _, error in
			if let e = error {
				print(e)
			}
			
			if let safeData = data {
				mainData = self.parseJSON(safeData)
			}
			completion(mainData)
			print("Data received!")
		}
		task.resume()
		
	}
	
	func parseJSON(_ safeData: Data) -> [Reply]{
		var fetchedData = [Reply]()
		let decoder = JSONDecoder()
		do {
			if let data = try? decoder.decode(DataModel.self, from: safeData) {
				let requiredData = data.transactions
				for i in 0...4 {
					let reply = Reply(startDate: requiredData[i].startDate, amount: requiredData[i].amount, description: requiredData[i].description, status: requiredData[i].status, direction: requiredData[i].direction)
					fetchedData.append(reply)
				}
			}
		}
		
		return fetchedData
	}
}
