//
//  SQQuranReader.swift
//  Quran App
//
//  Created by Hussein Ryalat on 9/1/17.
//  Copyright © 2017 Sketch Studio. All rights reserved.
//

import Foundation



#if canImport(XMLCoder)

/**
    Private type that acts as an intermediate for reading ayat from an xml file given, in which the structure consists of surahs where each surah contains the ayat.
 */
fileprivate class SQSurah: Codable {
    
    let name: String
    let index: Int
    let ayat: [Aya]
    
    init(dict: NSDictionary) {
        self.name = dict["name"] as! String
        self.index = Int(dict["index"] as! String)!
        
        var ayat: [Aya] = []
        for ayaDict in dict["aya"] as! [NSDictionary] {
            let aya = Aya(dict: ayaDict)
            ayat.append(aya)
        }
        
        self.ayat = ayat
    }
}

extension Aya {
    public convenience init(dict: NSDictionary) {
        let text = dict["text"] as! String
        let index = Int(dict["index"] as! String)!
        self.init(index: index, text: text)
    }
}


//MARK: Deprecated: QuranXMLReader

public class QuranXMLReader: QuranAyatReader {
    	    
	var ayatFilePath: String
	
	init(ayatFilePath: String){
		self.ayatFilePath = ayatFilePath
	}
	
	func readAyat() throws -> [Aya] {
		fatalError("Unimplemented, requires XMLDictionary Library")
		
		let parser = XMLDictionaryParser.sharedInstance()
		parser?.attributesMode = .unprefixed

		let dict = parser?.dictionary(withFile: ayatFilePath)

		var surahs: [SQSurah] = []
		for surahDict in dict?["sura"] as! [NSDictionary] {
			let newSurahRep = SQSurah(dict: surahDict)
			surahs.append(newSurahRep)
		}

		let ayat = surahs.reduce([], { (result, surah) -> [Aya] in
			return result + surah.ayat
		})

		for index in 0..<ayat.count {
			ayat[index].index = index
		}

		return ayat
	}
}


#endif
