//
//  MKPoint+VectorMath.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 19.01.26.
//

@inlinable public func dotProduct<Float: FloatingPoint & Sendable>(_ left: MKPoint<Float>, _ right: MKPoint<Float>) -> Float {
    (left.x * right.x).addingProduct(left.y, right.y)
}

@inlinable public func determinant<Float: FloatingPoint & Sendable>(_ first: MKPoint<Float>, _ second: MKPoint<Float>) -> Float {
    (first.x * second.y).addingProduct(-first.y, second.x)
}

public extension MKPoint {
    @inlinable func dotProduct(_ other: Self) -> Float {
        MathKit.dotProduct(self, other)
    }

    @inlinable func determinant(_ other: Self) -> Float {
        MathKit.determinant(self, other)
    }
}
