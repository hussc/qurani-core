//
//  Wird.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/21/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

/**
A wird is a set of ayat grouped togather from one index to a specified count, created as a sub-range of ayat for a specific ayat range description, a wird is always a closed range of ayat, and it doesn't matter if it's a sura or something else as long as it's an ayat!

Examples of Wirds might:
- SuraWird
- JuzWird
- AyatRangeWird
- RukuWird

Once a wird is generated, it's saved alongside with the ayat range description, where each ayat range description has a list of wirds.
*/
public struct Wird: AyatRangeModelType, Equatable, Hashable, Codable {

	/// describing the range ayat position and count
	public let startAyaIndex: Int
	public let ayasCount: Int
	
	/// the name of the wird, usually sura name or the ayat range or something like this, this is nessecary.
	public let name: String
	
	/// A subtitle or short description of the wird, if nothing is set, then it's up to the reciever to decide what subtitle to put, usually this is set to the progress of the wird.
	public let description: String?
	
	/// Wirds are created internally
	internal init(startAyaIndex: Int, ayasCount: Int, name: String, description: String){
		self.startAyaIndex = startAyaIndex
		self.ayasCount = ayasCount
		self.name = name
		self.description = description
	}
}
