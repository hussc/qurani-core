//
//  AyatRangeDescriptionType.swift
//  Qurani
//
//  Created by Hussein AlRyalat on 9/13/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public typealias AyaIndex = Int
public typealias AyatRange = ClosedRange<AyaIndex>

public struct AyatRangeDescriptionParameters {
    
	public init(aya: Aya, type: AyatRangeDescriptionType?){
        self.aya = aya
		self.type = type
    }
    
    public var aya: Aya
	public var type: AyatRangeDescriptionType?
}

/**
	The job for the range description provider is to provide a description for a choosen parameters, the parameters include the given ayat range.

	Although, another job is to list all available ayat range descriptions, so the user can choose from.
*/
public class AyatRangeDescriptionProvider<R: AyatRangeDescription> {
	
	public var descriptions: [R] {
		fatalError("Subclasses must return a value!")
	}
	
	public init(){ }
}

extension AyatRangeDescriptionProvider {
	
	/// a description is returned based on the start index of the range, usually there is only one description for the given start index of the range, so this one is taken.
	public func description(for parameters: AyatRangeDescriptionParameters) -> R? {
		return descriptions.filter {
			$0.type == parameters.type
		}.first {
			$0.ayatRange.contains(parameters.aya.index)
		}
	}
	
	// a description returned for specific aya
	public func description(for aya: Aya) -> R {
		return descriptions.first { $0.ayatRange.contains(aya.index) }!
	}
}


