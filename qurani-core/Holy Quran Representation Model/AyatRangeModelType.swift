//
//  AyatRangeModelType.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/18/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public protocol AyatRangeModelType: AyatIndexedModelType {
	
	/// When the aya starts
	var startAyaIndex: Int { get }
	
	/// the total of ayat
	var ayasCount: Int { get }
	
	/// auto property setted from the startAyaIndex and ayasCount
	var lastAyaIndex: Int { get }
	
	/// auto property, based on startAyaIndex and 
	var ayatRange: AyatRange { get }
	
	/// access the ayat
	var ayat: [Aya] { get }
	
	/// searches for existance for specified aya index
	func includesAya(at index: AyaIndex) -> Bool
	
	/// converts the global aya index to a local index ( relative to the reciever )
	func localIndex(for globalAyaIndex: AyaIndex) -> Int
}

public extension AyatRangeModelType {
	var ayatRange: AyatRange {
		return startAyaIndex...(startAyaIndex + ayasCount - 1)
	}
	
	var lastAyaIndex: Int {
		return startAyaIndex + ayasCount - 1
	}
	
	var ayat: [Aya] {
		return Array(Quran.ayat[ayatRange])
	}
	
	func includesAya(at index: AyaIndex) -> Bool {
		return ayatRange.contains(index)
	}
	
	func localIndex(for globalAyaIndex: AyaIndex) -> Int {
		(globalAyaIndex - startAyaIndex) + 1
	}
}
