//
//  FileMemorizablesStore.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/28/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

open class FileMemorizablesStore<R: AyatRangeDescription>: MemorizablesStore {
	
	public typealias RangeType = R
	
	public let fileURL: URL
	public var memorizables: [MemorizableAyatRange<R>]
	
	public init(fileURL: URL) {
		self.fileURL = fileURL
		
		if !FileManager.default.fileExists(atPath: fileURL.path){
			FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
		}
		
		do {
			let data = try Data(contentsOf: fileURL)
			let decoded = try JSONDecoder().decode([MemorizableDescriptor].self, from: data)
			
			self.memorizables = decoded.map {
				$0.resolve(for: R.self)!
			}
		} catch let error {
			print("Warning: no file was found or the data was not valid \(error), returning an empty collection")
			self.memorizables = []
		}
	}
	
	
	public func perform(operation: MemorizablesStoreOperation<R>) throws {
		switch operation {
		case .insert(let range):
			self.memorizables.insert(range, at: 0)
		case .delete(let range):
			// you got this boss :), now look for the memorizable that matches the given range, usually the same ** type, range and name **
			let index = memorizables.firstIndex {
				$0.ayatRange == range.ayatRange &&
					$0.name == range.name &&
					$0.type == range.type
			}
			
			guard let unwrappedIndex = index else {
				return
			}
			
			memorizables.remove(at: unwrappedIndex)
			break
		}
		
		try save()
	}
	
	fileprivate func save() throws {
		let descriptors = memorizables.map {
			MemorizableDescriptor(index: $0.ayatRangeDescription.index, type: $0.ayatRangeDescription.type, wirdGenerationType: $0.wirdGenerationType)
		}
		
		
		let data = try JSONEncoder().encode(descriptors)
		try data.write(to: fileURL)
	}
}
