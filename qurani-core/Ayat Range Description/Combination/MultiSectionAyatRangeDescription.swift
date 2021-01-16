//
//  SplittedAyatRangeDescription.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/16/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

/**
we have an ayat range description okay?
we need to split this description into sections, where each section represents another ayat range description

so the thing here is that the given global ayat description has a range of ayat, and with the help of a given description provider, we know 
*/

public class MultiSectionAyatRangeDescription<R1: AyatRangeDescription, R2: AyatRangeDescription>: AyatRangeDescriptionDisplayModel {
	
	public let globalAyatDescription: R1
	public let subDescriptionProvider: AyatRangeDescriptionProvider<R2>
	
	public init(globalAyatDescription: R1, subDescriptionProvider: AyatRangeDescriptionProvider<R2>){
		if R1.self == R2.self {
			fatalError("Can't split a description type \(R1.self) with sections of the same type!")
		}
		
		self.globalAyatDescription = globalAyatDescription
		self.subDescriptionProvider = subDescriptionProvider
	}
	
	public override var descriptions: [AyatRangeDescription] {		
		/* we start by taking the ayat in the global description */
		let ayat = globalAyatDescription.ayat
		
		var sum: [AyatRangeDescription] = []
		ayat.forEach {
			// make sure that the item is not already has been added..
			let subDescription = subDescriptionProvider.description(for: $0)
						
			if globalAyatDescription.startAyaIndex <= subDescription.startAyaIndex && globalAyatDescription.lastAyaIndex >= subDescription.lastAyaIndex {
				if !(sum.contains { subDescription.isEqualToRange($0) }){
					sum.append(subDescription)
				}
			} else {
				// make a dynamic range with the subrange taking only the range in common between the global and the sub
				
				// we take the max because we're really sure that the element is contained within the sub describtion
				let start = max(globalAyatDescription.startAyaIndex, subDescription.startAyaIndex)
				let end = min(globalAyatDescription.lastAyaIndex, subDescription.lastAyaIndex)
				
				let newDynamicRange = DynamicAyatRangeDescription(startAyaIndex: start, ayasCount: (start...end).count, baseRangeDescription: subDescription)
				
				if !(sum.contains { subDescription.isEqualToRange($0) }){
					sum.append(newDynamicRange)
				}
			}
		}
		
		return sum
	}
}
