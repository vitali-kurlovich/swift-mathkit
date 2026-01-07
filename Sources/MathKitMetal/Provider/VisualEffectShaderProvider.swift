//
//  VisualEffectShaderProvider.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public protocol VisualEffectShaderProvider: Sendable {
    var shaderLibrary: ShaderLibrary { get }

    func shaderFunction(for name: String) -> ShaderFunction
    func shader(_ proxy: GeometryProxy) -> Shader
}

public extension VisualEffectShaderProvider {
    var shaderLibrary: ShaderLibrary {
        .default
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

public extension SampleOffsetEffectShaderProvider {
    func maxSampleOffset(_: GeometryProxy) -> CGSize { .zero }
}

public protocol DistortionEffectShaderProvider: SampleOffsetEffectShaderProvider {}

public protocol LayerEffectShaderProvider: SampleOffsetEffectShaderProvider {}
