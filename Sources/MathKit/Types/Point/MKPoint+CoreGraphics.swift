//
//  MKPoint+CoreGraphics.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKPoint {
    @inlinable init(_ p: CGPoint) where Float == CGFloat {
        self.init(x: p.x, y: p.y)
    }
}

public extension CGPoint {
    init<F: BinaryFloatingPoint>(_ p: MKPoint<F>) {
        self.init(x: CGFloat(p.x), y: CGFloat(p.y))
    }
}

public extension MKPoint {
    static func == (lhs: Self, rhs: CGPoint) -> Bool where Float == CGFloat {
        lhs.x == rhs.x && lhs.y == rhs.y
    }

    static func == (lhs: CGPoint, rhs: Self) -> Bool where Float == CGFloat {
        rhs == lhs
    }
}
