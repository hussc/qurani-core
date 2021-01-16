//
//  PageAyatRangeDescriptionProvider.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/23/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class PageAyatRangeDescriptionProvider: AyatRangeDescriptionProvider<Page> {
	public override var descriptions: [Page] {
		return Quran.reference.pages
	}
}
