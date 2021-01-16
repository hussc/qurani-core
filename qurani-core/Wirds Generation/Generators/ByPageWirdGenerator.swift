//
//  ByJuzWirdGenerator.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class ByPageWirdGenerator: ByDescriptionTypeWirdGenerator<Page> {
	public override var manifist: WirdGeneratorManifist {
		return .init(
			name: "By Page",
			description: "Split the given range by a list of pages, where each wird represents a one page")
	}
}
