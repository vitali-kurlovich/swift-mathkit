//
//  DraggableControlsView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 8.01.26.
//

import SwiftUI

struct DraggableControlsView: View {
    @Binding var editorModel: TransformEditorModel

    var body: some View {
        DraggableHandles($editorModel.p0)
            .position(editorModel.p0)

        DraggableHandles($editorModel.p1)
            .position(editorModel.p1)

        DraggableHandles($editorModel.p2)
            .position(editorModel.p2)

        DraggableHandles($editorModel.p3)
            .position(editorModel.p3)
    }
}
