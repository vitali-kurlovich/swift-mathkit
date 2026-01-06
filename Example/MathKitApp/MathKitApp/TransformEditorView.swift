//
//  TransformEditorView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 31.12.25.
//

import MathKit
import SwiftUI

import MathKitMetal

struct TransformEditorView: View {
    @State var p0: CGPoint = .init(x: 10, y: 10)
    @State var p1: CGPoint = .init(x: 200, y: 10)
    @State var p2: CGPoint = .init(x: 200, y: 150)
    @State var p3: CGPoint = .init(x: 10, y: 150)

    var body: some View {
        RoundedRectangle(cornerSize: .init(width: 120, height: 120))
            .fill(.indigo.secondary)
            .overlay {
                Image(systemName: "heart.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow, .green, .red.gradient)
                    .font(.system(size: 220, weight: .semibold))
                    .symbolEffect(.breathe)
            }

            .geometryGroup()
            .controlPoints(
                p0: p0,
                p1: p1,
                p2: p2,
                p3: p3
            )
            .overlay {
                Canvas { context, _ in
                    let grid = EditorGrid(p0, p1, p2, p3)

                    context.stroke(grid.origin, with: .foreground)

                    context.stroke(grid.mediumGrid, with: .foreground,
                                   style: .init(lineWidth: 0.5, dash: [7, 2]))

                    context.stroke(grid.smallGrid,
                                   with: .foreground,
                                   style: .init(lineWidth: 0.25, dash: [3, 6]))

                    context.stroke(grid.outline,
                                   with: .foreground,
                                   style: .init(lineWidth: 0.75, dash: [4, 2]))
                }
            }
            .overlay {
                DraggableHandles($p0).position(p0)
                DraggableHandles($p1).position(p1)
                DraggableHandles($p2).position(p2)
                DraggableHandles($p3).position(p3)
            }
    }
}

#Preview {
    TransformEditorView().frame(width: 300, height: 250)
}
