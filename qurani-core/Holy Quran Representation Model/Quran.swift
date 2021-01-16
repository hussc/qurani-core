//
//  QuraniCoreDefaultStore.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/17/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

internal enum ResourceFile {
	fileprivate static let ayatXMLFile: String = {
		let bundle = Bundle(for: Quran.self)
		return bundle.path(forResource: "quran-simple-enhanced", ofType: "xml")!
	}()
	
	fileprivate static let ayatPlistFile: URL = {
		let bundle = Bundle(for: Quran.self)
		return bundle.url(forResource: "ayat", withExtension: "plist")!
	}()
	
	fileprivate static let quranReferenceFile: URL = {
		let bundle = Bundle(for: Quran.self)
		return bundle.url(forResource: "quran-data", withExtension: "plist")!
	}()
}

public class Quran {
	
	public internal(set) static var reference: QuranReference = {
		do {
			return try QuranReferencePlistReader(fileURL: ResourceFile.quranReferenceFile).readReference()
		} catch let error {
			fatalError("Quran Reference can't be created from the given resource file, would you try another? \(error)")
			
		}
	}()
	
	
	public internal(set) static var ayat: [Aya] = {
		do {
			return try AyatPlistReader(ayatFileURL: ResourceFile.ayatPlistFile).readAyat()
		} catch let error {
			fatalError("Ayat can't be created from the given resource file, would you try another? \(error)")
		}
	}()
}
