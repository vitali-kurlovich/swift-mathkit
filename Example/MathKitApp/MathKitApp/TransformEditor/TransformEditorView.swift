//
//  TransformEditorView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 31.12.25.
//

import MathKit
import SwiftUI

import MathKitMetal

struct TransformEditorView<Content: View>: View {
    @State private var p0: CGPoint = .init(x: 10, y: 10)
    @State private var p1: CGPoint = .init(x: 200, y: 10)
    @State private var p2: CGPoint = .init(x: 200, y: 150)
    @State private var p3: CGPoint = .init(x: 10, y: 150)

    @State
    private var gridConfiguration: TransformEditorGrid.Configuration = .init(showOutline: true, showOrigin: false, showGrid: true)

    @State
    private var showControlPoints = true

    @State
    private var isEditing = true

    @State private var contentSize: CGSize = .zero

    private let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: { newValue in
                contentSize = newValue
                print("View size: \(contentSize)")
            }

            .geometryGroup()
            .controlPoints(
                p0: p0,
                p1: p1,
                p2: p2,
                p3: p3,
                isEnabled: isEditing
            )
            .overlay {
                TransformEditorGrid(p0: $p0, p1: $p1, p2: $p2, p3: $p3, configuration: $gridConfiguration)
            }
            .overlay {
                if showControlPoints {
                    DraggableHandles($p0).position(p0)
                    DraggableHandles($p1).position(p1)
                    DraggableHandles($p2).position(p2)
                    DraggableHandles($p3).position(p3)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .status) {
                    Toggle(isOn: $showControlPoints) {
                        Image(systemName: "skew")
                    }

                    Toggle(isOn: $gridConfiguration.showOutline) {
                        Image(systemName: "rectangle.dashed")
                    }

                    Toggle(isOn: $gridConfiguration.showOrigin) {
                        Image(systemName: "dot.squareshape.split.2x2")
                    }

                    Toggle(isOn: $gridConfiguration.showGrid) {
                        Image(systemName: "squareshape.split.3x3")
                    }
                }

                ToolbarItemGroup(placement: .primaryAction) {
                    Toggle(isOn: $isEditing) {
                        Image(systemName: "perspective")
                    }
                }
            }
    }
}

#Preview {
    TransformEditorView {
        RoundedRectangle(cornerSize: .init(width: 120, height: 120))
            .fill(.indigo.secondary)
            .overlay {
                Image(systemName: "heart.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow, .green, .red.gradient)
                    .font(.system(size: 220, weight: .semibold))
                    .symbolEffect(.breathe)
            }.frame(width: 300, height: 250)
    }
}
