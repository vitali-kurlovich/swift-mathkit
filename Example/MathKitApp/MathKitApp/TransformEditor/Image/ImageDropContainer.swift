//
//  ImageDropContainer.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 7.01.26.
//

import SwiftUI
import UniformTypeIdentifiers

struct ImageDropContainer: View {
    @State private var image: Image? = nil
    @State private var isDropTargeted: Bool = false

    @State private var animationScale = 1.0

    var body: some View {
        ZStack {
            if let image {
                image.overlay {
                    Rectangle().fill(isDropTargeted ? Color.accentColor.tertiary : Color.clear.tertiary)
                }
            } else {
                ImageDropPlaceholder(isDropTargeted: $isDropTargeted)
            }
        }
        .scaleEffect(animationScale)
        .dropDestination(for: Image.self) { items, _ in
            // This closure is called when items are dropped
            if let firstImage = items.first {
                image = firstImage
                return true // Indicate success
            }
            return false
        } isTargeted: { targeted in
            // This closure updates the isTargeted binding
            isDropTargeted = targeted
        }.onChange(of: isDropTargeted) { _, newValue in
            animationScale = newValue ? 1.1 : 1.0
        }
        .animation(.bouncy,
                   value: animationScale)
    }
}
