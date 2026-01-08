//
//  ControlPointsTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 4.01.26.
//
import MathKit
import SwiftUI

public struct ControlPointsTransformShader: LayerEffectShaderProvider, Sendable {
    public var transform: ControlPointsTransform

    public init(_ transform: ControlPointsTransform) {
        self.transform = transform
    }

    public func shader(_: GeometryProxy) -> Shader {
        return Shader(
            function: shaderFunction(for: "controlPointsTransform"),
            arguments: [
                .boundingRect,
                .float2(p0),
                .float2(p1),
                .float2(p2),
                .float2(p3),
            ]
        )
    }

    public var shaderLibrary: ShaderLibrary {
        ShaderLibrary.bundle(Bundle.module)
    }

    public func maxSampleOffset(_: GeometryProxy) -> CGSize {
        .zero

        // .init(width: 200, height: 200)
    }
}

public extension ControlPointsTransformShader {
    init(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint) {
        self.init(.init(p0: p0, p1: p1, p2: p2, p3: p3))
    }

    var p0: CGPoint {
        get {
            transform.p0
        }
        set {
            transform.p0 = newValue
        }
    }

    var p1: CGPoint {
        get {
            transform.p1
        }
        set {
            transform.p1 = newValue
        }
    }

    var p2: CGPoint {
        get {
            transform.p2
        }
        set {
            transform.p2 = newValue
        }
    }

    var p3: CGPoint {
        get {
            transform.p3
        }
        set {
            transform.p3 = newValue
        }
    }
}
