//
//  BySuraWirdGenerator.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class BySuraWirdGenerator: ByDescriptionTypeWirdGenerator<Sura> {
	public override var manifist: WirdGeneratorManifist {
		return .init(
			name: "By Sura",
			description: "Split the given range by a list of sura's, where each wird represents a one sura")
	}
}
