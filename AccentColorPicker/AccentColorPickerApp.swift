//
//  AccentColorPickerApp.swift
//  AccentColorPicker
//
//  Created by Alex Lenkei on 1/25/23.
//

import SwiftUI

@main
struct AccentColorPickerApp: App {
	@Environment(\.customColor) private var color: Binding<Color>
	@AppStorage("color") var accentColor: Color = Color.indigo
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(\.customColor, $accentColor)
        }
    }
}
