//
//  MKRect+CoreGraphics.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKRect {
    @inlinable init(_ rect: CGRect) where Float == CGFloat {
        self.init(origin: .init(rect.origin), size: .init(rect.size))
    }
}

public extension CGRect {
    init<F: BinaryFloatingPoint>(_ rect: MKRect<F>) {
        self.init(origin: .init(rect.origin), size: .init(rect.size))
    }
}

public extension MKRect {
    static func == (lhs: Self, rhs: CGRect) -> Bool where Float == CGFloat {
        lhs.origin == rhs.origin && lhs.size == rhs.size
    }

    static func == (lhs: CGRect, rhs: Self) -> Bool where Float == CGFloat {
        rhs == lhs
    }
}
