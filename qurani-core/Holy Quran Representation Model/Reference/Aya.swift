//
//  SQAyah.swift
//  Quran App
//
//  Created by Hussein Ryalat on 5/18/16.
//  Copyright © 2016 Sketch Studio. All rights reserved.
//

import Foundation

public class Aya: Codable, Hashable {

    public internal(set) var text: String
	public internal(set) var index: Int
	
	public func hash(into hasher: inout Hasher) {
		hasher.combine(text)
		hasher.combine(index)
	}

	internal init(index: Int, text: String) {
		self.index = index
		self.text = text
	}
    
	enum CodingKeys: String, CodingKey {
        case text
        case index = "globalIndex"
    }
}

extension Aya: AyatIndexedModelType {
	public var startAyaIndex: Int {
		return index
	}
}

extension Aya: Equatable {
	public static func == (lhs: Aya, rhs: Aya) -> Bool {
		return lhs.index == rhs.index
	}
}

extension Aya: Comparable {
	public static func < (lhs: Aya, rhs: Aya) -> Bool {
		return lhs.index < rhs.index
	}
}

extension Aya: CustomStringConvertible {	
	public var description: String {
		return "\(index): { \(text) }"
	}
}


