//
//  MKPoint+VectorMath.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 19.01.26.
//

@inlinable public func dot<Float: FloatingPoint & Sendable>(_ left: MKPoint<Float>, _ right: MKPoint<Float>) -> Float {
    (left.x * right.x).addingProduct(left.y, right.y)
}

@inlinable public func cross<Float: FloatingPoint & Sendable>(_ first: MKPoint<Float>, _ second: MKPoint<Float>) -> Float {
    (first.x * second.y).addingProduct(-first.y, second.x)
}

public extension MKPoint {
    @inlinable func dot(_ other: Self) -> Float {
        MathKit.dot(self, other)
    }

    @inlinable func cross(_ other: Self) -> Float {
        MathKit.cross(self, other)
    }
}
