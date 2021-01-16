//
//  QuranReferencePlistReader.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/18/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

class QuranReferencePlistReader: QuranReferenceReader {

	var fileURL: URL
	
	init(fileURL: URL){
		self.fileURL = fileURL
	}
	
	func readReference() throws -> QuranReference {
		let decoder = PropertyListDecoder()
		let data = try Data(contentsOf: self.fileURL)
		
		return try decoder.decode(QuranReference.self, from: data)
	}
	
	
}
