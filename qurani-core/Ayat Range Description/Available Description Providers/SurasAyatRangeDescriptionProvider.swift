//
//  SurasAyatRangeDescriptionProvider.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/16/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class SurasAyatRangeDescriptionProvider: AyatRangeDescriptionProvider<Sura> {
	override public var descriptions: [Sura] {
		return Quran.reference.suras
	}
}

