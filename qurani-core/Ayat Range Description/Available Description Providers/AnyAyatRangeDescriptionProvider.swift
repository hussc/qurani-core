//
//  AnyAyatRangeDescriptionProvider.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/23/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class AnyAyatRangeDescriptionProvider: AyatRangeDescriptionProvider<AnyAyatRangeDescription> {
	
	let base: Any
	
	let _descriptions: [AyatRangeDescription]
	
	override public var descriptions: [AnyAyatRangeDescription] {
		return _descriptions.map { .init($0) }
	}
	
	public init<R: AyatRangeDescription>(_ base: AyatRangeDescriptionProvider<R>){
		self.base = base
		self._descriptions = base.descriptions
	}
}
