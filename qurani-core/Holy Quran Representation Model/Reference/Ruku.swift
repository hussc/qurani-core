//
//  Ruku.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/17/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class Ruku: Codable, AyatRangeModelType {

	public let index: Int
	public let startAyaIndex: Int
	public let ayasCount: Int
	
	enum CodingKeys: CodingKey {
		case ayasCount
		case index
		case startAyaIndex
	}
	
	internal init(index: Int, startAyaIndex: Int, ayasCount: Int) {
		self.index = index
		self.startAyaIndex = startAyaIndex
		self.ayasCount = ayasCount
	}
}
