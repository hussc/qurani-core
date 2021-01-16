//
//  Sura.swift
//  Qurani
//
//  Created by Hussein AlRyalat on 8/11/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class Sura: Codable, AyatRangeModelType {
	
	public let index: Int
	public let ayasCount: Int
    public let startAyaIndex: Int
    
	public let name: String
    public let suraType: String
    public let order: Int
    public let rukus: Int

	internal init(index: Int, ayasCount: Int, startAyaIndex: Int, name: String, suraType: String, order: Int, rukus: Int) {
		self.index = index
		self.ayasCount = ayasCount
		self.startAyaIndex = startAyaIndex
		self.name = name
		self.suraType = suraType
		self.order = order
		self.rukus = rukus
	}
}

public extension Sura {
	var description: String {
		return "وعدد آياتها \(self.ayat.count)"
	}
}

