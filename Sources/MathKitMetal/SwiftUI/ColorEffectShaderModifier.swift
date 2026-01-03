//
//  ColorEffectShaderModifier.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public extension View {
    func shaderEffect<Provider: ColorEffectShaderProvider>(_ provider: Provider) -> some View {
        modifier(ColorEffectShaderModifier(provider))
    }
}

struct ColorEffectShaderModifier<Provider: ColorEffectShaderProvider>: ViewModifier {
    let provider: Provider

    init(_ provider: Provider) {
        self.provider = provider
    }

    func body(content: Content) -> some View {
        content.visualEffect { content, proxy in
            content
                .colorEffect(
                    provider.shader(content: content, proxy: proxy),
                    isEnabled: provider.isEnabled
                )
        }
    }
}
