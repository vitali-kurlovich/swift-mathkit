//
//  CGPoint+CGVector.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 30.12.25.
//

import Foundation

public extension CGPoint {
    @inlinable init(_ vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
}

public extension CGPoint {
    @inlinable static func + (left: CGVector, right: Self) -> Self {
        return .init(x: left.dx + right.x, y: left.dy + right.y)
    }

    @inlinable static func + (left: Self, right: CGVector) -> Self {
        return .init(x: left.x + right.dx, y: left.y + right.dy)
    }
}
