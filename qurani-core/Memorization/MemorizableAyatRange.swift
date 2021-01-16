//
//  MemorizableAyatRange.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/24/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class MemorizableAyatRange<R: AyatRangeDescription>: AyatRangeDescription {
	
	/// The ayat range description used
	public let ayatRangeDescription: R
	
	/// The generated wirds for the description
	public let wirds: [Wird]
	
	/// The generation method used
	public let wirdGenerationType: WirdGeneratorChooser.WirdGenerationType
	
	public init(ayatRangeDescription: R, wirds: [Wird], wirdGenerationType: WirdGeneratorChooser.WirdGenerationType){
		self.ayatRangeDescription = ayatRangeDescription
		self.wirds = wirds
		self.wirdGenerationType = wirdGenerationType
	}
	
	public init(ayatRangeDescription: R, wirdGenerationType: WirdGeneratorChooser.WirdGenerationType){
		self.ayatRangeDescription = ayatRangeDescription
		self.wirdGenerationType = wirdGenerationType
		self.wirds = WirdGeneratorChooser().generator(for: wirdGenerationType).wirds(for: ayatRangeDescription)
	}
}

extension MemorizableAyatRange {
	public var name: String {
		return ayatRangeDescription.name
	}
	
	public var subtitle: String {
		return ayatRangeDescription.subtitle
	}
	
	public var index: Int {
		return ayatRangeDescription.index
	}
	
	public var type: AyatRangeDescriptionType {
		return ayatRangeDescription.type
	}
	
	public var startAyaIndex: Int {
		return ayatRangeDescription.startAyaIndex
	}
	
	public var ayasCount: Int {
		return ayatRangeDescription.ayasCount
	}
}

public extension MemorizableAyatRange {
	func dynamicAyatRangeDescription(startWirdIndex: Int, endWirdIndex: Int) -> DynamicAyatRangeDescription {
		let startAyaIndex = self.wirds[startWirdIndex].startAyaIndex
		let lastAyaIndex = self.wirds[endWirdIndex].lastAyaIndex
		
		return DynamicAyatRangeDescription(startAyaIndex: startAyaIndex,
										   ayasCount: (startAyaIndex...lastAyaIndex).count,
										   baseRangeDescription: self.ayatRangeDescription)
	}
}
