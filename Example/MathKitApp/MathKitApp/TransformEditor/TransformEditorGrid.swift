//
//  TransformEditorGrid.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 7.01.26.
//

import SwiftUI

struct TransformEditorGrid: View {
    @Binding var editorModel: TransformEditorModel

    @Binding var configuration: TransformEditorConfiguration

    var body: some View {
        Canvas { context, _ in
            let grid = EditorGrid(editorModel.p0, editorModel.p1, editorModel.p2, editorModel.p3)
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
