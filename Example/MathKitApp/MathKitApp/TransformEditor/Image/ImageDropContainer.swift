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
        .dropDestination(
            for: Image.self
        ) { receivedImages, _ in
            image = receivedImages.first
        }
        .dropConfiguration { dropSession in
            debugPrint(dropSession)

            isDropTargeted = dropSession.phase == .active

            if dropSession.suggestedOperations.contains(.move) {
                return DropConfiguration(operation: .move)
            }
            return DropConfiguration(operation: .copy)
        }
        .onChange(of: isDropTargeted) { oldValue, newValue in
            guard oldValue != newValue else { return }
            animationScale = newValue ? 1.1 : 1.0
        }
        .animation(.bouncy,
                   value: animationScale)
    }
}
