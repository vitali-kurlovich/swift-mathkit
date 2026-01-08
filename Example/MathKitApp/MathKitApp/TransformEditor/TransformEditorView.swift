//
//  TransformEditorView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 31.12.25.
//

import MathKit
import SwiftUI

import MathKitMetal

struct EditedContent: View {
    enum ContentType: CaseIterable {
        case animation
        case image
    }

    @Binding var contentType: ContentType

    var body: some View {
        switch contentType {
        case .animation:
            AnimatedPlaceholder()
        case .image:
            ImageDropContainer()
        }
    }
}

struct TransformEditorView: View {
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

    @State private var contentFrame: CGRect = .zero

    typealias ContentType = EditedContent.ContentType
    @State private var contentType: ContentType = .animation

    var body: some View {
        EditedContent(contentType: $contentType)
            .onGeometryChange(for: CGRect.self) { proxy in
                proxy.frame(in: .local)
            } action: { frame in
                resetControlPoints(in: frame)
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
                ToolbarItemGroup(placement: .secondaryAction) {
                    Picker("Select Mode", selection: $contentType) {
                        Image(systemName: "heart.rectangle.fill").tag(ContentType.animation)
                        Image(systemName: "photo").tag(ContentType.image)
                    }
                    .pickerStyle(.segmented)
                }

                ToolbarItemGroup(placement: .automatic) {
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

                ToolbarSpacer(.flexible)

                ToolbarItem(placement: .automatic) {
                    Button("Reset", systemImage: "square.dashed") {
                        resetControlPoints(in: contentFrame)
                    }
                }

                ToolbarItem(placement: .automatic) {
                    Toggle(isOn: $isEditing) {
                        Image(systemName: "perspective")
                    }
                }
            }
            .padding()
    }
}

private extension TransformEditorView {
    func resetControlPoints(in frame: CGRect) {
        p0 = .init(x: frame.minX, y: frame.minY)
        p1 = .init(x: frame.maxX, y: frame.minY)
        p2 = .init(x: frame.maxX, y: frame.maxY)
        p3 = .init(x: frame.minX, y: frame.maxY)

        contentFrame = frame
    }
}

#Preview {
    TransformEditorView()
}
