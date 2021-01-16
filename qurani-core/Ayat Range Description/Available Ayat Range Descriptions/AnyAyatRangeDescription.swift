//
//  AnyAyatRangeDescription.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/19/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class AnyAyatRangeDescription: AyatRangeDescription {
	
	public var ayasCount: Int {
		return base.ayasCount
	}
	
	public var startAyaIndex: Int {
		return base.startAyaIndex
	}
	
	public var name: String {
		return base.name
	}
	
	public var index: Int {
		return base.index
	}
	
	public var subtitle: String {
		return base.subtitle
	}
	
	public var ayatRange: AyatRange {
		return base.ayatRange
	}
	
	public var type: AyatRangeDescriptionType {
		return base.type
	}
	
	public let base: AyatRangeDescription
	
	internal init(_ base: AyatRangeDescription) {
		self.base = base
	}
}

