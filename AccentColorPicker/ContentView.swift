//
//  ContentView.swift
//  AccentColorPicker
//
//  Created by Alex Lenkei on 1/25/23.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.customColor) private var color: Binding<Color>
	
	var body: some View {
		NavigationStack {
			List {
				NavigationLink(destination: AccentColorPicker(viewModel: AccentColorManager())) {
					Text("Accent Color")
				}
			}
			.navigationTitle("Settings")
		}
		.tint(color.wrappedValue)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
