//
//  ContentView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TransformEditorView {
            RoundedRectangle(cornerSize: .init(width: 120, height: 120))
                .fill(.indigo.secondary)
                .overlay {
                    Image(systemName: "heart.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .green, .red.gradient)
                        .font(.system(size: 220, weight: .semibold))
                        .symbolEffect(.breathe)
                }
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
