//
//  Sajda.swift
//  Qurani
//
//  Created by Hussein AlRyalat on 8/11/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class Sajda: Codable, AyatIndexedModelType {

	public let index: Int
	public let type: String
	public let startAyaIndex: Int
	
	enum CodingKeys: CodingKey {
		case type
		case index
		case startAyaIndex
	}
	
	internal init(index: Int, type: String, startAyaIndex: Int) {
		self.index = index
		self.type = type
		self.startAyaIndex = startAyaIndex
	}
}
