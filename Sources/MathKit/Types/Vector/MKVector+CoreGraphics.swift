//
//  MKVector+CoreGraphics.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKVector {
    @inlinable init(_ v: CGVector) where Float == CGFloat {
        self.init(dx: v.dx, dy: v.dy)
    }
}

public extension CGVector {
    init<F: BinaryFloatingPoint>(_ p: MKVector<F>) {
        self.init(dx: CGFloat(p.dx), dy: CGFloat(p.dy))
    }
}
