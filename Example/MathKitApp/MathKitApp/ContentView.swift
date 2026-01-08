//
//  ContentView.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TransformEditorView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
    }
}

#Preview {
    ContentView()
}
