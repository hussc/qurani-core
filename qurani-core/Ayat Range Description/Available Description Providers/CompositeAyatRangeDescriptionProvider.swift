//
//  CompositeAyatRangeDescriptionProvider.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/23/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class CompositeAyatRangeDescriptionProvider: AyatRangeDescriptionProvider<AnyAyatRangeDescription> {
	
	var providers: [AnyAyatRangeDescriptionProvider] = []
	
	override public var descriptions: [AnyAyatRangeDescription] {
		return providers.reduce([]) { (result, provider) in
			return result + provider.descriptions
		}
	}
	
	public func register<R: AyatRangeDescription>(provider: AyatRangeDescriptionProvider<R>){
		if let anyProvider = provider as? AnyAyatRangeDescriptionProvider {
			providers.append(anyProvider)
		} else {
			providers.append(.init(provider))
		}
	}
}
