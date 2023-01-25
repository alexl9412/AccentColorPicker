//
//  AccentColorPicker.swift
//  AccentColorPicker
//
//  Created by Alex Lenkei on 1/25/23.
//

import SwiftUI

struct AccentColorPicker: View {
	@StateObject var accentColorManager = AccentColorManager()
	
	var chosenColor: Color {
		accentColorManager.loadColor()
	}
	
	@State private var localColor = Color.indigo
	
	enum AccentColors: CaseIterable {
		case red, orange, yellow, green, mint, teal, cyan, blue, indigo, purple, pink, brown
		
		var title: String {
			switch self {
			case .red: return "Red"
			case .orange: return "Orange"
			case .yellow: return "Yellow"
			case .green: return "Green"
			case .mint: return "Mint"
			case .teal: return "Teal"
			case .cyan: return "Cyan"
			case .blue: return "Blue"
			case .indigo: return "Indigo"
			case .purple: return "Purple"
			case .pink: return "Pink"
			case .brown: return "Brown"
			}
		}
		
		var color: Color {
			switch self {
			case .red: return Color.red
			case .orange: return Color.orange
			case .yellow: return Color.yellow
			case .green: return Color.green
			case .mint: return Color.mint
			case .teal: return Color.teal
			case .cyan: return Color.cyan
			case .blue: return Color.blue
			case .indigo: return Color.indigo
			case .purple: return Color.purple
			case .pink: return Color.pink
			case .brown: return Color.brown
			}
		}
	}
	
	var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
	
    var body: some View {
		List {
			Section("Accent Color") {
				LazyVGrid(columns: gridItemLayout, spacing: 10) {
					ForEach(AccentColors.allCases, id: \.self) { color in
						Button {
							localColor = color.color
							accentColorManager.saveColor(color: color.color)
						} label: {
							VStack {
								Rectangle()
									.cornerRadius(14)
									.frame(width: 60, height: 60)
									.foregroundColor(color.color)
									.overlay(color.color == localColor ? Image(systemName: "checkmark").foregroundColor(.primary) : Image(systemName: "checkmark").foregroundColor(.clear))
								Text(color.title)
							}
						}
						.buttonStyle(.plain)
					}
				}
			}
		}
    }
}

struct AccentColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        AccentColorPicker()
    }
}
