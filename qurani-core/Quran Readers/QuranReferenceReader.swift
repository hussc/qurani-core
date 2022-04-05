//
//  QuranReferenceBackingStore.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/17/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

/**
 A type that performs a read of marks in the holy quran, that does not include the ayat.
 */
internal protocol QuranReferenceReader: AnyObject {
	func readReference() throws -> QuranReference
}
