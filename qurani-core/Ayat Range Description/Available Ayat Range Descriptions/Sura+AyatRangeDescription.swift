//
//  Sura+AyatRangeDescription.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/18/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

extension Sura: AyatRangeDescription {
	public var type: AyatRangeDescriptionType {
		return .sura
	}
	
	public var subtitle: String {
		return description
	}
}

public extension Aya {
	var sura: Sura {
		return SurasAyatRangeDescriptionProvider().description(for: self)
	}
}
