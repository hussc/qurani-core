//
//  WirdGeneratorChooser.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation



public class WirdGeneratorChooser {
	
	/// An enum that specifies the way you want to generate the wirds
	public enum WirdGenerationType {
		case bySura
		case byAyat(each: Int)
		case byPage
		case single
		case byJuz
		
		static func type(for identifier: String) -> WirdGenerationType {
			let parts = identifier.split(separator: " ").map(String.init)
			
			guard let firstPart = parts.first else {
				return .single
			}
			
			if parts.count == 2 {
				guard let value = Int(parts[1]) else {
					return .single
				}
				
				return .byAyat(each: value)
			}
			
			switch firstPart {
			case "sura":
				return .bySura
			case "page":
				return .byPage
			case "juz":
				return .byJuz
			default:
				return .single
			}
		}
		
		func typeString() -> String {
			switch self {
			case .bySura:
				return "sura"
			case .byPage:
				return "page"
			case .byJuz:
				return "juz"
			case .single:
				return "single"
			case .byAyat(let each):
				return "ayat \(each)"
			}
		}
	}
	
	public init(){ }
	
	/**
	Returns a WirdGeneratorType for the specific type ( with it's parameters if set ) given.
	*/
	public func generator(for type: WirdGenerationType) -> WirdGeneratorType {
		switch type {
		case .bySura:
			return BySuraWirdGenerator()
		case .byPage:
			return ByPageWirdGenerator()
		case .byJuz:
			return ByJuzWirdGenerator()
		case .byAyat(let each):
			return ByAyatWirdGenerator(each: each)
		case .single:
			return SingleWirdGenerator()
		}
	}
}
