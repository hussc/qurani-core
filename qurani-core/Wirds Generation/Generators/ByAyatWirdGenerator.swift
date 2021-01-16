//
//  ByAyatWirdGenerator.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class ByAyatWirdGenerator: WirdGeneratorType {
	
	public let each: Int
	
	public var manifist: WirdGeneratorManifist {
		return .init(
			name: "By Ayat",
			description: "Will split the given range by each \(each) ayat.")
	}
	
	public init(each: Int){
		self.each = each
	}
	
	public func wirds(for ayatRange: AyatRangeModelType) -> [Wird] {
		let startIndex = ayatRange.startAyaIndex
		
		var wirds: [Wird] = []
		var currentIndex = startIndex
		
		// keep looping until we reach the upper bound
		while currentIndex < ayatRange.ayatRange.upperBound {
			let ayasCount = min(each, ayatRange.ayatRange.upperBound - currentIndex)
			let finalIndex = currentIndex + ayasCount - 1
			
			let currentLocalIndex = ayatRange.localIndex(for: currentIndex)
			let finalLocalIndex = ayatRange.localIndex(for: finalIndex)
			
			let generatedWird = Wird(
				startAyaIndex: currentIndex,
				ayasCount: ayasCount,
				name: "\(currentLocalIndex) - \(finalLocalIndex)",
				description: "")
			
			wirds.append(generatedWird)
			currentIndex += each
		}
		
		return wirds
	}
}
