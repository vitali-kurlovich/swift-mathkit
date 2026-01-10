//
//  MKPoint+MKVector.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public extension MKPoint {
    @inlinable init(_ vector: MKVector<Float>) {
        self.init(x: vector.dx, y: vector.dy)
    }
}

public extension MKPoint {
    @inlinable static func + (left: Self, right: MKVector<Float>) -> Self {
        return .init(x: left.x + right.dx, y: left.y + right.dy)
    }

    @inlinable static func + (left: MKVector<Float>, right: Self) -> Self {
        right + left
    }
}
