//
//  AccentColorPicker.swift
//  AccentColorPicker
//
//  Created by Alex Lenkei on 1/25/23.
//

import SwiftUI

struct AccentColorPicker: View {
	
	@ObservedObject var viewModel: AccentColorManager
	var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

	var body: some View {
		
		// custom picker using a LazyVGrid
		List {
			Section("Accent Color") {
				LazyVGrid(columns: gridItemLayout, spacing: 10) {
					ForEach(viewModel.zippedColors, id:\.1) { option in
						Button {
							viewModel.accentColor = option.1
						} label: {
							VStack {
								RoundedRectangle(cornerRadius: 14)
									.fill(option.0)
									.frame(width: 55, height: 55)
									.cornerRadius(14)
									.padding(5)
								
								// first option for showing selected color: gray outline in overlay modifier below
									.overlay(content: {
										if viewModel.accentColor == option.1 {
											RoundedRectangle(cornerRadius: 19)
												.stroke(.gray, lineWidth: 5)
										}
									})
								//
								// second option for showing selected color: checkmark in overlay modifier below
//									.overlay(content: {
//										if viewModel.accentColor == option.1 {
//											Image(systemName: "checkmark")
//										}
//									})
								Text(option.1)
							}.tag(option.1)
						}
						.buttonStyle(.plain)
					}
					.onChange(of: viewModel.accentColor, perform: { value in
						viewModel.convertColor(color: value)
					})
				}
			}
		}
		
		// alternative layout using Picker in a grouped list
//		List {
//			Picker(selection: $viewModel.accentColor, label: EmptyView()) {
//				ForEach(viewModel.zippedColors, id:\.1) { option in
//					HStack(spacing: 20) {
//						Circle()
//							.fill(option.0)
//							.frame(width: 40, height: 40)
//							.padding(.vertical, 0)
//						Text(option.1)
//					}.tag(option.1)
//				}
//				.onChange(of: viewModel.accentColor, perform: { value in
//					viewModel.convertColor(color: value)
//				})
//			}
//			.pickerStyle(InlinePickerStyle())
//		}
//		.listStyle(InsetGroupedListStyle())
	}
}

struct AccentColorPicker_Previews: PreviewProvider {
    static var previews: some View {
		AccentColorPicker(viewModel: AccentColorManager())
    }
}
