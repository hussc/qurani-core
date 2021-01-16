//
//  SingleSectionAyatRangeDescription.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/19/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class SingleSectionAyatRangeDescription<R: AyatRangeDescription>: AyatRangeDescriptionDisplayModel {
	
	public let globalAyatDescription: R
	
	public init(globalAyatDescription: R){
		self.globalAyatDescription = globalAyatDescription
	}
	
	public override var descriptions: [AyatRangeDescription] {
		return [globalAyatDescription]
	}
}
