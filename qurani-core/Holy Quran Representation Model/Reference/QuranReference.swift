//
//  QuranReference.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/17/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import Foundation

public class QuranReference: Codable {

	public let suras: [Sura]
	public let juzs: [Juz]
	public let sajdas: [Sajda]
	public let hizbs: [Hizb]
	public let pages: [Page]
	public let rukus: [Ruku]
	public let manzils: [Manzil]
	
	internal init(suras: [Sura], juzs: [Juz], sajdas: [Sajda], hizbs: [Hizb], pages: [Page], rukus: [Ruku], manzils: [Manzil]) {
		self.suras = suras
		self.juzs = juzs
		self.sajdas = sajdas
		self.hizbs = hizbs
		self.pages = pages
		self.rukus = rukus
		self.manzils = manzils
	}
}
