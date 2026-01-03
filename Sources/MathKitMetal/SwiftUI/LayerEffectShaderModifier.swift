//
//  LayerEffectShaderModifier.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public extension View {
    func shaderEffect<Provider: LayerEffectShaderProvider>(_ provider: Provider) -> some View {
        modifier(LayerEffectShaderModifier(provider))
    }
}

struct LayerEffectShaderModifier<Provider: LayerEffectShaderProvider>: ViewModifier {
    let provider: Provider

    init(_ provider: Provider) {
        self.provider = provider
    }

    func body(content: Content) -> some View {
        content.visualEffect { content, proxy in
            content.layerEffect(provider.shader(content: content, proxy: proxy),
                                maxSampleOffset: provider.maxSampleOffset,
                                isEnabled: provider.isEnabled)
        }
    }
}
