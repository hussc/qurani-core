//
//  MemorizableDescriptor.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/25/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public struct MemorizableDescriptor: Hashable, Codable {
	public let index: Int
	public let type: AyatRangeDescriptionType
	public let wirdGenerationTypeIdentifier: String
	
	public init(index: Int, type: AyatRangeDescriptionType, wirdGenerationType: WirdGeneratorChooser.WirdGenerationType){
		self.index = index
		self.type = type
		self.wirdGenerationTypeIdentifier = wirdGenerationType.typeString()
	}
	
	public func resolve<R: AyatRangeDescription>(for type: R.Type) -> MemorizableAyatRange<R>? {
		
		let provider = DescriptionProvidersManager.shared.descriptionProvider(for: self.type, ofType: type)
		let range = provider.descriptions[index]
		let generationType = WirdGeneratorChooser.WirdGenerationType.type(for: wirdGenerationTypeIdentifier)
		
		let wirdGenerator = WirdGeneratorChooser().generator(for: generationType)
		
		return MemorizableAyatRange<R>(ayatRangeDescription: range, wirds: wirdGenerator.wirds(for: range), wirdGenerationType: generationType)
	}
	
	public func resolve() -> MemorizableAyatRange<AnyAyatRangeDescription> {
		self.resolve(for: AnyAyatRangeDescription.self)!
	}
}
