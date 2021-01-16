//
//  SQProgressContainer.swift
//  Quran App
//
//  Created by Hussein Ryalat on 9/2/17.
//  Copyright © 2017 Sketch Studio. All rights reserved.
//

import Foundation


public protocol QuraniProgressGroup: QuraniProgressable {
        
    /* an array of items to display */
    var progressItems: [QuraniProgressable] { get }
}

public extension QuraniProgressGroup {
	func progress(with store: AyatMemorizeStateProvider) -> Progress {
		let progress = Progress.discreteProgress(totalUnitCount: Int64(progressItems.count))

		progressItems.forEach {
			progress.addChild($0.progress(with: store), withPendingUnitCount: 1)
		}
		
		return progress
	}
}

extension MemorizableAyatRange: QuraniProgressGroup where R: QuraniProgressable {
	public var progressItems: [QuraniProgressable] {
		wirds
	}
}
