//
//  QuranAyatBackingStore.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/17/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

/**
 Any reader takes the content of the ayat from it's file, and performs a read operation to return an array of "Aya", in the holy quran.
 */
internal protocol QuranAyatReader: class {
	func readAyat() throws -> [Aya]
}
