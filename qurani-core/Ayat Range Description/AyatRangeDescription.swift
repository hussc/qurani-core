//
//  Wird.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/16/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

/**
	So, we have ayat range description, which represents a range of ayat encapsulated with information, one and most famous example is Sura, which describes a range of ayat in the holy quran, and has specific attributes.

	Another type is Juz, which is also an ayat range description, with a name.

	A range description usually used to represent a closed range of ayat, usually to give the client the ability to split the range into 'wirds'.
*/

public protocol AyatRangeDescription: AyatRangeModelType {
	
	/// the name of the desciption
	var name: String { get }
	
	/// represents the order of the description between it's brothers.
	var index: Int { get }
	
	/// additional information
	var subtitle: String { get }
	
	
	var type: AyatRangeDescriptionType { get }
}

public extension AyatRangeDescription {
	var isEqualToRange: ((AyatRangeDescription) -> Bool){
		return { anotherRangeDescription in
			
			// differant range types always won't be equal
			if anotherRangeDescription.type != self.type {
				return false
			}
			
			// As the index is the base thing to compare.
			return self.index == anotherRangeDescription.index
		}
	}
}

public extension Array where Element: AyatRangeDescription {
	func contains(_ item: Element) -> Bool {
		return self.contains { $0.isEqualToRange(item) }
	}
}
