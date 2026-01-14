//
//  CGVector+Arithmetic.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 30.12.25.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public extension CGVector {
        @inlinable static prefix func - (_ vec: Self) -> Self {
            .init(dx: -vec.dx, dy: -vec.dy)
        }

        @inlinable static func * (vector: Self, scalar: CGFloat) -> Self {
            return .init(dx: vector.dx * scalar, dy: vector.dy * scalar)
        }

        @inlinable static func * (scalar: CGFloat, vector: Self) -> Self {
            return .init(dx: vector.dx * scalar, dy: vector.dy * scalar)
        }

        @inlinable static func / (left: Self, scalar: CGFloat) -> Self {
            return .init(dx: left.dx / scalar, dy: left.dy / scalar)
        }
    }

#endif // canImport(CoreGraphics)
