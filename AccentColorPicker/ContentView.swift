//
//  ContentView.swift
//  AccentColorPicker
//
//  Created by Alex Lenkei on 1/25/23.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationStack {
			List {
				NavigationLink(destination: AccentColorPicker()) {
					Text("Accent Color")
				}
			}
			.navigationTitle("Settings")
		}
		.tint(AccentColorManager.shared.loadColor())
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
