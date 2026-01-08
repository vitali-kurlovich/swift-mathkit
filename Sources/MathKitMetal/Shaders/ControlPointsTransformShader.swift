//
//  ControlPointsTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 4.01.26.
//
import MathKit
import SwiftUI

public struct ControlPointsTransformShader: LayerEffectShaderProvider, Sendable {
    public var p0: CGVector
    public var p1: CGVector
    public var p2: CGVector
    public var p3: CGVector

    public init(p0: CGVector, p1: CGVector, p2: CGVector, p3: CGVector) {
        self.p0 = p0
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
    }

    public func shader(_ proxy: GeometryProxy) -> Shader {
        let frame = proxy.frame(in: .local)

        let p0 = CGPoint(x: frame.minX, y: frame.minY)
        let p1 = CGPoint(x: frame.maxX, y: frame.minY)

        let p2 = CGPoint(x: frame.maxX, y: frame.maxY)
        let p3 = CGPoint(x: frame.minX, y: frame.maxY)

        return Shader(
            function: shaderFunction(for: "controlPointsTransform"),
            arguments: [
                .boundingRect,
                .float2(p0 + self.p0),
                .float2(p1 + self.p1),
                .float2(p2 + self.p2),
                .float2(p3 + self.p3),
            ]
        )
    }

    public var shaderLibrary: ShaderLibrary {
        ShaderLibrary.bundle(Bundle.module)
    }

    public func maxSampleOffset(_: GeometryProxy) -> CGSize {
        .zero
    }
}
