//
//  ByDescriptionTypeWirdGenerator.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation


public class ByDescriptionTypeWirdGenerator<DescriptionType: AyatRangeDescription>: WirdGeneratorType {
	
	var provider: AyatRangeDescriptionProvider<DescriptionType> {
		return DescriptionProvidersManager.shared.descriptionProvider(ofType: DescriptionType.self)!
	}
	
	
	public var manifist: WirdGeneratorManifist {
		fatalError("Subclasses must override this property")
	}
	
	public func wirds(for ayatRange: AyatRangeModelType) -> [Wird] {
		let ayat = ayatRange.ayat
		
		var sum: [AyatRangeDescription] = []
		ayat.forEach {
			
			// while the subdescribtion might container ayat not in the range, we want to trim it a little bit :-)
			// by taking the max between the start of each two subdescribtions
			
			let subDescription = provider.description(for: $0)
			var describtionToTake: AyatRangeDescription

			
			if subDescription.startAyaIndex < ayatRange.startAyaIndex {
				let range = DynamicAyatRangeDescription(startAyaIndex: ayatRange.startAyaIndex,
														ayasCount: subDescription.lastAyaIndex - ayatRange.startAyaIndex + 1,
														baseRangeDescription: subDescription)
				
				
				describtionToTake = range
			} else if subDescription.lastAyaIndex > ayatRange.lastAyaIndex {
				
				let range = DynamicAyatRangeDescription(startAyaIndex: subDescription.startAyaIndex,
														ayasCount: ayatRange.lastAyaIndex - subDescription.startAyaIndex + 1,
														baseRangeDescription: subDescription)
				
				
				describtionToTake = range
			} else {
				describtionToTake = subDescription
			}
			
			if !(sum.contains { describtionToTake.isEqualToRange($0) }){
				sum.append(describtionToTake)
			}
		}
		
		
		return sum.map {
			return self.wird(for: $0)
		}
	}
	
	internal func wird(for description: AyatRangeDescription) -> Wird {
		return Wird(
			startAyaIndex: description.startAyaIndex,
			ayasCount: description.ayasCount,
			name: description.name,
			description: description.subtitle)
	}
}
