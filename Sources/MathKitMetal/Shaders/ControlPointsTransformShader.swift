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

    public func maxSampleOffset(_ proxy: GeometryProxy) -> CGSize {
        let local = proxy.frame(in: .local)
        let bounds = self.bounds(proxy)

        let topOffset = local.minY - bounds.minY
        let bottomOffset = bounds.maxY - local.maxY

        let leftOffset = local.minX - bounds.minX
        let rightOffset = bounds.maxX - local.maxX

        let width = max(leftOffset, rightOffset)
        let height = max(topOffset, bottomOffset)

        return .init(width: width, height: height)
    }
}

private extension ControlPointsTransformShader {
    func points(_ proxy: GeometryProxy) -> (CGPoint, CGPoint, CGPoint, CGPoint) {
        let local = proxy.frame(in: .local)

        let p0 = CGPoint(x: local.minX, y: local.minY) + self.p0
        let p1 = CGPoint(x: local.maxX, y: local.minY) + self.p1
        let p2 = CGPoint(x: local.maxX, y: local.maxY) + self.p2
        let p3 = CGPoint(x: local.minX, y: local.maxY) + self.p3

        return (p0, p1, p2, p3)
    }

    func bounds(_ proxy: GeometryProxy) -> CGRect {
        let local = proxy.frame(in: .local)

        let (p0, p1, p2, p3) = points(proxy)

        let minX = min(p0.x, p1.x, p2.x, p3.x, local.minX)
        let maxX = max(p0.x, p1.x, p2.x, p3.x, local.maxX)

        let minY = min(p0.y, p1.y, p2.y, p3.y, local.minY)
        let maxY = max(p0.y, p1.y, p2.y, p3.y, local.maxY)

        return .init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
