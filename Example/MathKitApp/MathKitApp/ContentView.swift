//
//  ContentView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import SwiftUI

struct ContentView: View {
    @State var animationEditorModel: TransformEditorModel = .init(contentType: .animation)
    @State var imageEditorModel: TransformEditorModel = .init(contentType: .image)
    var body: some View {
        TabView {
            Tab("Amimation", systemImage: "heart.rectangle.fill") {
                TransformEditorView(editorModel: $animationEditorModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            }
            Tab("Photo", systemImage: "photo") {
                TransformEditorView(editorModel: $imageEditorModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
