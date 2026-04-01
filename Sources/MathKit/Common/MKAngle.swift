//
//  MKAngle.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 28.12.25.
//

public nonisolated struct MKAngle<Float: FloatingPoint & Sendable>: Hashable & Sendable {
    public var radians: Float

    @inlinable public var degrees: Float {
        radians * (180 / Float.pi)
    }

    @inlinable public init() {
        self.init(radians: 0)
    }

    @inlinable public init(radians: Float) {
        self.radians = radians
    }

    @inlinable public init(degrees: Float) {
        self.init(radians: degrees * (.pi / 180))
    }

    @inlinable public static func radians(_ radians: Float) -> Self {
        .init(radians: radians)
    }

    @inlinable public static func degrees(_ degrees: Float) -> Self {
        .init(degrees: degrees)
    }
}

public extension MKAngle {
    static var zero: Self { .init() }
}

public extension MKAngle {
    @inlinable static prefix func - (_ angle: Self) -> Self {
        .init(radians: -angle.radians)
    }
}

extension MKAngle: AdditiveArithmetic {
    public static func + (lhs: MKAngle<Float>, rhs: MKAngle<Float>) -> MKAngle<Float> {
        .init(radians: lhs.radians + rhs.radians)
    }

    public static func - (lhs: MKAngle<Float>, rhs: MKAngle<Float>) -> MKAngle<Float> {
        .init(radians: lhs.radians - rhs.radians)
    }

    @inlinable public static func += (left: inout Self, right: Self) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
}
