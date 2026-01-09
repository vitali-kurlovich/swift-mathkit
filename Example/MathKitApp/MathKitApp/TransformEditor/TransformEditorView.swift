//
//  TransformEditorView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 31.12.25.
//

import MathKitMetal
import SwiftUI

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
    @State var editorModel: TransformEditorModel = .init()
    @State var configuration: TransformEditorConfiguration = .init()

    typealias ContentType = EditedContent.ContentType

    var body: some View {
        ZStack {
            EditedContent(contentType: $configuration.contentType)
                .onGeometryChange(for: CoordinateSpace.self) { proxy in
                    let local = proxy.frame(in: .local)
                    let global = proxy.frame(in: .global)

                    debugPrint(local, global)

                    return .init(proxy)
                } action: { space in
                    editorModel.contentSpace = space

//                    editorModel.update(local: geometry.local, global: geometry.global)
                }
                .geometryGroup()
//                .controlPoints(
//                    p0: editorModel.p0,
//                    p1: editorModel.p1,
//                    p2: editorModel.p2,
//                    p3: editorModel.p3,
//                    isEnabled: configuration.isEditing
//                )
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                TransformEditorGrid(editorModel: $editorModel,
                                    configuration: $configuration)
                    .onGeometryChange(for: CoordinateSpace.self) { proxy in
                        let local = proxy.frame(in: .local)
                        let global = proxy.frame(in: .global)

                        // debugPrint(local, global)

                        return .init(proxy)
                    } action: { space in
                        editorModel.gridSpace = space
                    }
            }
            .overlay {
                if configuration.showControlPoints {
                    DraggableControlsView(editorModel: self.$editorModel)
                        .onGeometryChange(for: CoordinateSpace.self) { proxy in
                            let local = proxy.frame(in: .local)
                            let global = proxy.frame(in: .global)

                            //  debugPrint(local, global)

                            return .init(proxy)
                        } action: { space in
                            editorModel.controlsSpace = space
                        }
                    // .offset(editorModel.offset)
                }
            }

            .toolbar(editorModel, $configuration)
    }
}

#Preview {
    TransformEditorView()
}
