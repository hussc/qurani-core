//
//  AyatRangeDisplayModelChooser.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/19/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class AyatRangeDisplayModelChooser<R: AyatRangeDescription> {
	
	public init(){ }
	
	public func displayModel<SectionType: AyatRangeDescription>(for ayatDescription: R, sectionType: SectionType.Type) -> AyatRangeDescriptionDisplayModel {
		
		let provider = DescriptionProvidersManager.shared.descriptionProvider(ofType: sectionType)!
		

		if sectionType is R {
			return SingleSectionAyatRangeDescription(globalAyatDescription: ayatDescription)
		} else {
			return MultiSectionAyatRangeDescription<R, SectionType>(globalAyatDescription: ayatDescription, subDescriptionProvider: provider)
		}
	}
}
