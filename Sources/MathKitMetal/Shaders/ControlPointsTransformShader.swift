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

    public var displayScale: CGFloat

    public init(_ transform: ControlPointsTransform, displayScale: CGFloat) {
        self.transform = transform
        self.displayScale = displayScale
    }

    public func shader(_: GeometryProxy) -> Shader {
        return Shader(
            function: shaderFunction(for: "controlPointsTransform"),
            arguments: [
                .boundingRect,
                .float2(p0 * displayScale),
                .float2(p1 * displayScale),
                .float2(p2 * displayScale),
                .float2(p3 * displayScale),
            ]
        )
    }

    public var shaderLibrary: ShaderLibrary {
        ShaderLibrary.bundle(Bundle.module)
    }

    public func maxSampleOffset(_: GeometryProxy) -> CGSize {
        .zero // .init(width: 50, height: 50)
    }
}

public extension ControlPointsTransformShader {
    init(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint, displayScale: CGFloat) {
        let transform = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)
        self.init(transform, displayScale: displayScale)
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
