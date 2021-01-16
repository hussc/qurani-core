//
//  JuzAyatRangeDescriptionProvider.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/16/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class JuzAyatRangeDescriptionProvider: AyatRangeDescriptionProvider<Juz> {
	public override var descriptions: [Juz] {
		return Quran.reference.juzs
	}
}
