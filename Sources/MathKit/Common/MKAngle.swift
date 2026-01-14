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
