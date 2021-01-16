//
//  QuranXMLReader.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/17/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

class AyatPlistReader: QuranAyatReader {
	
	var ayatFileURL: URL
	
	init(ayatFileURL: URL){
		self.ayatFileURL = ayatFileURL
	}
	
	func readAyat() throws -> [Aya] {
		let decoder = PropertyListDecoder()
		let data = try Data(contentsOf: self.ayatFileURL)
		return try decoder.decode([Aya].self, from: data)
	}
}
