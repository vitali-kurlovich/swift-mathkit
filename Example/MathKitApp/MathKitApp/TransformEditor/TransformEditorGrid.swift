//
//  TransformEditorGrid.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 7.01.26.
//

import SwiftUI

struct TransformEditorGrid: View {
    @Binding var p0: CGPoint
    @Binding var p1: CGPoint
    @Binding var p2: CGPoint
    @Binding var p3: CGPoint

    @Binding
    var configuration: Configuration

    var body: some View {
        Canvas { context, _ in
            let grid = EditorGrid(p0, p1, p2, p3)
            if configuration.showOrigin {
                context.stroke(grid.origin, with: .foreground)
            }

            if configuration.showGrid {
                context.stroke(grid.mediumGrid, with: .foreground,
                               style: .init(lineWidth: 0.5, dash: [7, 2]))

                context.stroke(grid.smallGrid,
                               with: .foreground,
                               style: .init(lineWidth: 0.25, dash: [3, 6]))
            }
            if configuration.showOutline {
                context.stroke(grid.outline,
                               with: .foreground,
                               style: .init(lineWidth: 0.75, dash: [4, 2]))
            }
        }
    }
}

extension TransformEditorGrid {
    struct Configuration: Hashable {
        var showOutline: Bool
        var showOrigin: Bool
        var showGrid: Bool
    }
}
