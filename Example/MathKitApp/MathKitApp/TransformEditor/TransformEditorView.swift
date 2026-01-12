//
//  TransformEditorView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 31.12.25.
//

import MathKitMetal
import SwiftUI

struct TransformEditorView: View {
    @Binding var editorModel: TransformEditorModel
    @State var configuration: TransformEditorConfiguration = .init()

    var body: some View {
        ZStack {
            if containsContent {
                EditedContent(editorModel: $editorModel)
                    .onGeometryChange(for: ContentGeometry.self) { proxy in
                        .init(proxy)
                    } action: { geometry in
                        editorModel.contentGeometry = geometry
                    }
                    .geometryGroup()
                    .controlPoints(
                        p0: editorModel.p0,
                        p1: editorModel.p1,
                        p2: editorModel.p2,
                        p3: editorModel.p3,
                        isEnabled: configuration.isEditing
                    )
            }
        }
        .editorToolOverlay(editorModel: $editorModel, configuration: $configuration)
        .toolbar($editorModel, $configuration)
    }
}

private extension TransformEditorView {
    var containsContent: Bool {
        switch editorModel.contentType {
        case .animation:
            return true
        case .image:
            return editorModel.image != nil
        }
    }
}

private extension TransformEditorView {
    struct EditedContent: View {
        @Binding var editorModel: TransformEditorModel

        var body: some View {
            switch editorModel.contentType {
            case .animation:
                AnimatedPlaceholder()
            case .image:
                editorModel.image
            }
        }
    }
}

#Preview {
    @Previewable @State var editorModel: TransformEditorModel = .init(contentType: .animation)

    TransformEditorView(editorModel: $editorModel)
}
