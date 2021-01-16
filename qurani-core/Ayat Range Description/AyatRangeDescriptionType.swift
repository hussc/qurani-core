//
//  MemorizableType.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/16/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public enum AyatRangeDescriptionType: Int, CaseIterable, Codable {
	case sura
	case juz
	case page
//	case hizb
//	case ruku
//	case manzil
	
	public var name: String {
		switch self {
		case .sura:
			return "سورة"
		case .juz:
			return "جزء"
		case .page:
			return "صفحة"
		}
	}
}
