//
//  MKSize+CoreGraphics.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKSize {
    @inlinable init(_ size: CGSize) where Float == CGFloat {
        self.init(width: size.width, height: size.height)
    }
}

public extension CGSize {
    init<F: BinaryFloatingPoint>(_ size: MKSize<F>) {
        self.init(width: CGFloat(size.width), height: CGFloat(size.height))
    }
}

public extension MKSize {
    static func == (lhs: Self, rhs: CGSize) -> Bool where Float == CGFloat {
        lhs.width == rhs.width && lhs.height == rhs.height
    }

    static func == (lhs: CGSize, rhs: Self) -> Bool where Float == CGFloat {
        rhs == lhs
    }
}
