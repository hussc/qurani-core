//
//  SQProgressItem.swift
//  Quran App
//
//  Created by Hussein Ryalat on 5/23/16.
//  Copyright © 2016 Sketch Studio. All rights reserved.
//

import Foundation

/**
 *  @brief a progress item defines simple function to mark the the class as progressable and show it's progress in the progress views..
 */
public protocol QuraniProgressable {
    
    /// the name of item.. required to show it..
    var name: String { get }
    
    /**
     A simple function for returing the progress of an object, object must return a value between 0 and 1, the progress will be displayed to the user with the name..
     */
	func progress(with store: AyatMemorizeStateProvider) -> Progress
}

public extension QuraniProgressable where Self: AyatRangeModelType {
	func progress(with store: AyatMemorizeStateProvider) -> Progress {
		let progress = Progress(totalUnitCount: Int64(ayatRange.count))
		progress.completedUnitCount = ayat.reduce(0, { result, aya in
			return result + ( store.state(for: aya) == .completed ? 1 : 0 )
		})
		
		return progress
	}
}

// for basic elemnets
extension Sura: QuraniProgressable { }
extension Juz: QuraniProgressable { }
extension Page: QuraniProgressable { }

// for any type-eraser
extension AnyAyatRangeDescription: QuraniProgressable { }

// for wirds and their parents :)
extension Wird: QuraniProgressable { }
extension MemorizableAyatRange: QuraniProgressable where R: QuraniProgressable { }
