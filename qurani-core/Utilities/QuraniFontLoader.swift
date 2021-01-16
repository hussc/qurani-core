//
//  QuraniFont.swift
//  QuraniCore
//
//  Created by Hussein AlRyalat on 11/22/19.
//  Copyright © 2019 SketchMe. All rights reserved.
//

import UIKit


public class QuraniFont {
	
	enum AvailableFontNames: String {
		case uthmaniScript = "KFGQPC HAFS Uthmanic Script"
		case uthmaniScriptBold = ""
	}
	
	
	fileprivate static let defaultFontName: String = "UthmanicHafs1B Ver12"
	fileprivate static var isFontLoaded: Bool = false
	
	fileprivate static func loadFont(with name: String) {
		let frameworkBundle = Bundle(for: QuraniFont.self)
		let pathForResourceString = frameworkBundle.path(forResource: name, ofType: "otf")
		let fontData = NSData(contentsOfFile: pathForResourceString!)
		let dataProvider = CGDataProvider(data: fontData!)
		let fontRef = CGFont(dataProvider!)
		var errorRef: Unmanaged<CFError>? = nil
		
		if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
			NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
		}
	}
	
	
	public static func font(with size: CGFloat) -> UIFont {
		if !isFontLoaded {
			loadFont(with: defaultFontName)
			isFontLoaded = true
		}
		
		return UIFont(name: defaultFontName, size: size)!
	}
}
