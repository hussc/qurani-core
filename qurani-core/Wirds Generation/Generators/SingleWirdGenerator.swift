//
//  SingleWirdGenerator.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/25/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation


public class SingleWirdGenerator: WirdGeneratorType {
	public var manifist: WirdGeneratorManifist {
		return .init(
			name: "Single",
			description: "Just takes the whole input as a wird")
	}
	
	public func wirds(for ayatRange: AyatRangeModelType) -> [Wird] {
		return [
			Wird(startAyaIndex: ayatRange.startAyaIndex,
				 ayasCount: ayatRange.ayasCount,
				 name: "\(ayatRange.startAyaIndex) - \(ayatRange.startAyaIndex + ayatRange.ayasCount)",
				description: "")
		]
	}
}
