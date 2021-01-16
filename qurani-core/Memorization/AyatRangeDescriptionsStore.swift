//
//  AyatRangeDescriptionsStore.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/24/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public enum MemorizablesStoreOperation<RangeType: AyatRangeDescription> {
	case delete(range: MemorizableAyatRange<RangeType>)
	case insert(range: MemorizableAyatRange<RangeType>)
}

/// A type that acts as the backing store for retriving the range description models saved for the user.
public protocol MemorizablesStore {
	
	/// A type which the stores deals with
	associatedtype RangeType: AyatRangeDescription
	
	/// All the ranges that the user chooses to save.
	var memorizables: [MemorizableAyatRange<RangeType>] { get }
	
	/// A store performs an operation such as insert or delete
	func perform(operation: MemorizablesStoreOperation<RangeType>) throws
}

