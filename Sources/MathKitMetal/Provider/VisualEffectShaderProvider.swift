//
//  VisualEffectShaderProvider.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public protocol VisualEffectShaderProvider: Sendable {
    var isEnabled: Bool { get }
    var shaderLibrary: ShaderLibrary { get }

    func shaderFunction(for name: String) -> ShaderFunction
    func shader(_ proxy: GeometryProxy) -> Shader
}

public extension VisualEffectShaderProvider {
    var isEnabled: Bool {
        true
    }

    var shaderLibrary: ShaderLibrary {
        ShaderLibrary.bundle(Bundle.module)
    }

    func shaderFunction(for name: String) -> ShaderFunction {
        assert(!name.isEmpty)

        return ShaderFunction(library: shaderLibrary, name: name)
    }
}

public protocol ColorEffectShaderProvider: VisualEffectShaderProvider {}

public protocol SampleOffsetEffectShaderProvider: VisualEffectShaderProvider {
    func maxSampleOffset(_ proxy: GeometryProxy) -> CGSize
}

extension SampleOffsetEffectShaderProvider {
    func maxSampleOffset(_: GeometryProxy) -> CGSize { .zero }
}

public protocol DistortionEffectShaderProvider: SampleOffsetEffectShaderProvider {}

public protocol LayerEffectShaderProvider: SampleOffsetEffectShaderProvider {}
