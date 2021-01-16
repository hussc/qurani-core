//
//  QuraniNumberFormatter.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public protocol AyaIndexFormatter {
	func string(for ayaIndex: AyaIndex) -> String
}

public class DefaultAyaIndexFormatter: AyaIndexFormatter {
	
	internal static var internalShared: DefaultAyaIndexFormatter = .init()
	
	let numberFormatter: NumberFormatter = {
		let nf = NumberFormatter()
		nf.allowsFloats = false
		nf.locale = Locale(identifier: "ar")
		return nf
	}()
	
	public init(){
		
	}
	
	public func string(for ayaIndex: AyaIndex) -> String {
		return numberFormatter.string(from: .init(value: ayaIndex))!
	}
}

public extension Int {
	var localizedString: String {
		return DefaultAyaIndexFormatter.internalShared.string(for: self)
	}
}
