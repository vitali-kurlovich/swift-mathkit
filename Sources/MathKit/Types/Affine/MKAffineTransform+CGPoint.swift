//
//  MKAffineTransform+CGPoint.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

// Transform
public extension MKAffineTransform {
    func transform(_ point: CGPoint) -> CGPoint where Float == CGFloat {
        .init(x: m11 * point.x + m21 * point.y + tx,
              y: m12 * point.x + m22 * point.y + ty)
    }
}

public extension MKAffineTransform {
    @inlinable func transform(_ rect: CGRect) -> CGRect where Float == CGFloat {
        .init(transform(MKRect(rect)))
    }
}

// MKAffineTransform+Core
