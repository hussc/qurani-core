//
//  Page+AyatRangeDescription.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

extension Page: AyatRangeDescription {
	public var name: String {
		"Page \(index)"
	}
	
	public var type: AyatRangeDescriptionType {
		return .page
	}
	
	public var subtitle: String {
		return ""
	}
}

public extension Aya {
	var page: Page {
		return PageAyatRangeDescriptionProvider().description(for: self)
	}
}
