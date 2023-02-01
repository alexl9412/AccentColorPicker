//
//  AccentColorManager.swift
//  AccentColorPicker
//
//  Created by Alex Lenkei on 1/25/23.
//

import SwiftUI

extension Color: RawRepresentable {
	public init?(rawValue: String) {
		guard let data = Data(base64Encoded: rawValue) else {
			self = .indigo
			return
		}
		
		do {
			let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor ?? .systemIndigo
			self = Color(color)
		} catch {
			self = .indigo
		}
	}

	public var rawValue: String {
		do {
			let data = try NSKeyedArchiver.archivedData(withRootObject: UIColor(self), requiringSecureCoding: false) as Data
			return data.base64EncodedString()
		} catch {
			return ""
		}
	}
}

struct CustomColorKey: EnvironmentKey {
	static var defaultValue: Binding<Color> = Binding.constant(.indigo)
}

extension EnvironmentValues {
	var customColor: Binding<Color> {
		get { self[CustomColorKey.self] }
		set { self[CustomColorKey.self] = newValue }
	}
}

class AccentColorManager: ObservableObject {
	
	@AppStorage("color") var selectedColor: Color = Color.indigo
	@AppStorage("colorName") var accentColor: String = "Indigo"
	
	private var colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.mint, Color.teal, Color.cyan, Color.blue, Color.indigo, Color.purple, Color.pink, Color.brown]
	
	private var colorNames = ["Red", "Orange", "Yellow", "Green", "Mint", "Teal", "Cyan", "Blue", "Indigo", "Purple", "Pink", "Brown"]
	
	var zippedColors: [(Color, String)] { return Array(zip(colors, colorNames)) }
	
	func convertColor(color: String) {
		selectedColor = zippedColors.filter { $0.1 == color }.compactMap { $0 }[0].0
	}
}
