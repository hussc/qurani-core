//
//  DescriptionProvidersManager.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/18/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class DescriptionProvidersManager {
	
	public static let shared: DescriptionProvidersManager = {
		let new = DescriptionProvidersManager(descriptionProviders: [
			.sura : .init(SurasAyatRangeDescriptionProvider()),
			.juz: .init(JuzAyatRangeDescriptionProvider()),
			.page: .init(PageAyatRangeDescriptionProvider())
		])
		
		return new
	}()
	
	// a list of available description types, you can access their providers too.
	public var availableDescriptionTypes: [AyatRangeDescriptionType] {
		return Array(descriptionsProviders.keys)
	}
	
	
	// shipped with default description providers
	public internal(set) var descriptionsProviders: [AyatRangeDescriptionType: AnyAyatRangeDescriptionProvider]
	
	
	public init(descriptionProviders: [AyatRangeDescriptionType: AnyAyatRangeDescriptionProvider] = [:]){
		self.descriptionsProviders = descriptionProviders
	}
	
	public func compositeDescriptionProvider() -> CompositeAyatRangeDescriptionProvider {
		let provider = CompositeAyatRangeDescriptionProvider()
		descriptionsProviders.values.forEach {
			provider.register(provider: $0)
		}
		
		return provider
	}
	 
	public func register<R: AyatRangeDescription>(descriptionProvider: AyatRangeDescriptionProvider<R>, for type: AyatRangeDescriptionType){
		self.descriptionsProviders[type] = .init(descriptionProvider)
	}
	
	/** returns a type erased description provider ( AnyAyatRangeDescriptionProvider ) for a specific type */
	public func descriptionProvider<R: AyatRangeDescription>(for descriptionType: AyatRangeDescriptionType, ofType type: R.Type) -> AyatRangeDescriptionProvider<R> {
		if type == AnyAyatRangeDescription.self {
			return descriptionsProviders[descriptionType] as! AyatRangeDescriptionProvider<R>
		}
		
		
		return descriptionsProviders[descriptionType]?.base as! AyatRangeDescriptionProvider<R>
	}
	
	public func descriptionProvider<R: AyatRangeDescription>(ofType: R.Type) -> AyatRangeDescriptionProvider<R>? {
		// auto determine the type for given description type
		for descriptionProvider in descriptionsProviders.values {
			if let unwrapped = descriptionProvider.base as? AyatRangeDescriptionProvider<R> {
				return unwrapped
			}
		}
		
		return nil
	}
	
	public func descriptionProvider(for descriptionType: AyatRangeDescriptionType) -> AnyAyatRangeDescriptionProvider {
		return descriptionsProviders[descriptionType]!
	}
}

public extension Aya {
	var suraIndex: Int {
		return DescriptionProvidersManager.shared.descriptionProvider(ofType: Sura.self)!.description(for: self).index
	}
	
	var juzIndex: Int {
		return DescriptionProvidersManager.shared.descriptionProvider(ofType: Juz.self)!.description(for: self).index
	}
	
	var pageIndex: Int {
		return DescriptionProvidersManager.shared.descriptionProvider(ofType: Page.self)!.description(for: self).index
	}
}



public extension Aya {
	var indexRelativeToSura: Int {
		DescriptionProvidersManager.shared.descriptionProvider(for: .sura).descriptions.first { $0.includesAya(at: self.index) }!.localIndex(for: self.index)
	}
}
