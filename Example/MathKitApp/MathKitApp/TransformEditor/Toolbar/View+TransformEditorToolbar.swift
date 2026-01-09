//
//  View+TransformEditorToolbar.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 8.01.26.
//

import SwiftUI

extension View {
    func toolbar(_ editorModel: Binding<TransformEditorModel>,
                 _ configuration: Binding<TransformEditorConfiguration>) -> some View
    {
        typealias ContentType = TransformEditorModel.ContentType

        return toolbar {
            ToolbarItemGroup(placement: .secondaryAction) {
                Picker("Select Mode", selection: editorModel.contentType) {
                    Image(systemName: "heart.rectangle.fill").tag(ContentType.animation)
                    Image(systemName: "photo").tag(ContentType.image)
                }
                .pickerStyle(.segmented)
            }

            ToolbarItemGroup(placement: .automatic) {
                Toggle(isOn: configuration.showControlPoints) {
                    Image(systemName: "skew")
                }

                Toggle(isOn: configuration.showOutline) {
                    Image(systemName: "rectangle.dashed")
                }

                Toggle(isOn: configuration.showOrigin) {
                    Image(systemName: "dot.squareshape.split.2x2")
                }

                Toggle(isOn: configuration.showGrid) {
                    Image(systemName: "squareshape.split.3x3")
                }
            }

            ToolbarSpacer(.flexible)

            ToolbarItem(placement: .automatic) {
                Button("Reset", systemImage: "square.dashed") {
                    editorModel.wrappedValue.reset()
                }
            }

            ToolbarItem(placement: .automatic) {
                Toggle(isOn: configuration.isEditing) {
                    Image(systemName: "perspective")
                }
            }
        }
    }
}
