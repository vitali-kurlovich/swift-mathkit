//
//  CollorEffectShaderModifier.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public extension View {
    func shaderEffect<Provider: CollorEffectShaderProvider>(_ provider: Provider) -> some View {
        modifier(CollorEffectShaderModifier(provider))
    }
}

public struct CollorEffectShaderModifier<Provider: CollorEffectShaderProvider>: ViewModifier {
    let provider: Provider

    public init(_ provider: Provider) {
        self.provider = provider
    }

    public func body(content: Content) -> some View {
        content.visualEffect { content, proxy in
            content
                .colorEffect(
                    provider.shader(content: content, proxy: proxy)
                )
        }
    }
}
