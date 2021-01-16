//
//  WirdGeneratorType.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/21/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public protocol WirdGeneratorType {
		
	/// manifist for the generator..
	var manifist: WirdGeneratorManifist { get }
	
	/// generates a list of wirds for given ayat range
	func wirds(for ayatRange: AyatRangeModelType) -> [Wird]
}
