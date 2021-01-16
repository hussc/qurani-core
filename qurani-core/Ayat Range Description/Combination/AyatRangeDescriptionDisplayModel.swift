//
//  AyatRangeDescriptionDisplayModel.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/19/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class AyatRangeDescriptionDisplayModel {
	public var descriptions: [AyatRangeDescription] {
		return []
	}
}

public extension AyatRangeDescriptionDisplayModel {
	
	var sectionsCount: Int {
		return descriptions.count
	}
	
	func ayatCount(in section: Int) -> Int {
		return descriptions[section].ayatRange.count
	}
	
	func indexPath(for aya: Aya) -> IndexPath? {
		// find the description that contains that specific aya, usually this is the first one, but in any other case, take the first one.
		guard let descriptionIndex = (descriptions.firstIndex { $0.ayat.contains(aya) }) else {
			return nil
		}
		
		// what's the number of this description?
		let description = descriptions[descriptionIndex]
		
		// transform the index of the aya to a local index
		let localIndex = description.localIndex(for: aya.index)
		
		
		return IndexPath(row: localIndex - 1, section: descriptionIndex)
	}
	
	func aya(at indexPath: IndexPath) -> Aya? {
		guard indexPath.section > 0 && indexPath.section < descriptions.count else {
			return nil
		}
		
		let description = descriptions[indexPath.section]
		
		// no need to transform the index path row into a global index, since the ayat array has a local indexing system.
		return description.ayat[indexPath.row]
	}
}
