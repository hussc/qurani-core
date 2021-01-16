//
//  Juz+AyatRangeDescription.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/18/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

extension Juz: AyatRangeDescription {
	public var name: String {
		switch self.index {
		case 27:
			return "جزء قد سمع"
		case 28:
			return "جزء تبارك"
		case 29:
			return "جزء عمّ"
		default:
			let indexString = DefaultAyaIndexFormatter.internalShared.string(for: index + 1)
			return "الجزء " + indexString
		}
	}
	
	public var type: AyatRangeDescriptionType {
		return .juz
	}
	
	public var subtitle: String {
		let firstAya = self.ayat.first!
		let lastAya = self.ayat.last!
		let surasProvider = DescriptionProvidersManager.shared.descriptionProvider(ofType: Sura.self)!
		
		let firstSura = surasProvider.description(for: firstAya)
		let lastSura = surasProvider.description(for: lastAya)
		
		if firstSura.index == lastSura.index {
			return firstSura.name
		} else {
			return "من " + firstSura.name + " إلى " + lastSura.name
		}
	}
}

public extension Aya {
	var juz: Juz {
		return JuzAyatRangeDescriptionProvider().description(for: self)
	}
}
