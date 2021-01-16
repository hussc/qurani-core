//
//  DynamicAyatRangeDescription.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 12/3/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation


public class DynamicAyatRangeDescription: AyatRangeDescription {
	
	public let base: AyatRangeDescription
	public let ayasCount: Int
	public let startAyaIndex: Int
	
	public var index: Int {
		return base.index
	}
	
	public var name: String {
		return base.name
	}
	
	public var subtitle: String {
		return base.subtitle
	}
	
	public var type: AyatRangeDescriptionType {
		return base.type
	}
	
	public func localIndex(for globalAyaIndex: AyaIndex) -> Int {
		return base.localIndex(for: globalAyaIndex)
	}
	
	public init(startAyaIndex: AyaIndex, ayasCount: Int, baseRangeDescription: AyatRangeDescription) {
		self.startAyaIndex = startAyaIndex
		self.ayasCount = ayasCount
		self.base = baseRangeDescription
	}
}
