//
//  AccentColorManager.swift
//  AccentColorPicker
//
//  Created by Alex Lenkei on 1/25/23.
//

import Foundation
import SwiftUI
import UIKit

class AccentColorManager: ObservableObject {
	var colorKey = "color key"
	private let userDefaults = UserDefaults.standard
	static let shared = AccentColorManager()
	//@Published var chosenColor: Color
	
	func saveColor(color: Color) {
		// Convert the color into RGB
		let color = UIColor(color).cgColor
		
		// Save the RGB into an array
		if let components = color.components {
			userDefaults.set(components, forKey: colorKey)
			print(components)
			print("Color saved!")
		}
	}
	
	func loadColor() -> Color 	{
		// Get the RGB array
		guard let array = userDefaults.object(forKey: colorKey) as? [CGFloat] else { return Color.indigo }
		
		// Create a color from the RGB array
		let color = Color(.sRGB,
						  red: array[0],
						  green: array[1],
						  blue: array[2],
						  opacity: array[3])
		
		print("Color loaded!")
		return color
	}
}
