//
//  DistortionEffectShaderModifier.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public extension View {
    func shaderEffect<Provider: DistortionEffectShaderProvider>(_ provider: Provider) -> some View {
        modifier(DistortionEffectShaderModifier(provider))
    }
}

struct DistortionEffectShaderModifier<Provider: DistortionEffectShaderProvider>: ViewModifier {
    let provider: Provider

    init(_ provider: Provider) {
        self.provider = provider
    }

    func body(content: Content) -> some View {
        content.visualEffect { content, proxy in
            content.distortionEffect(provider.shader(proxy),
                                     maxSampleOffset: provider.maxSampleOffset(proxy),
                                     isEnabled: provider.isEnabled)
        }
    }
}
