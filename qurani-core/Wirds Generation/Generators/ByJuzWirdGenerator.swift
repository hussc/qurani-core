//
//  ByJuzWirdGenerator.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 12/4/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class ByJuzWirdGenerator: ByDescriptionTypeWirdGenerator<Juz> {
	public override var manifist: WirdGeneratorManifist {
		return .init(
			name: "By Juz",
			description: "Split the given range by a list of juz's, where each wird represents a one juz")
	}
}
