//
//  MKVector.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public nonisolated struct MKVector<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var dx: Float
    public var dy: Float

    @inlinable public init(dx: Float, dy: Float) {
        self.dx = dx
        self.dy = dy
    }
}

public extension MKVector {
    @inlinable init() {
        self.init(dx: 0, dy: 0)
    }

    @inlinable static var zero: Self {
        .init()
    }
}

public extension MKVector {
    @inlinable static func + (left: Self, size: MKSize<Float>) -> Self {
        return .init(dx: left.dx + size.width, dy: left.dy + size.width)
    }

    @inlinable static func += (left: inout Self, size: MKSize<Float>) {
        left = left + size
    }
}

extension MKVector: AdditiveArithmetic {
    @inlinable public static func + (left: Self, right: Self) -> Self {
        return .init(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }

    @inlinable public static func - (left: Self, right: Self) -> Self {
        return .init(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }

    @inlinable public static func += (left: inout Self, right: Self) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
}
