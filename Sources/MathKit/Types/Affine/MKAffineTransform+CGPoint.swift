//
//  MKAffineTransform+CGPoint.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

// Transform
public extension MKAffineTransform where Float == CGFloat {
    func transform(_ point: CGPoint) -> CGPoint {
        .init(transform(MKPoint(point)))
    }

    @inlinable func transform(_ rect: CGRect) -> CGRect {
        .init(transform(MKRect(rect)))
    }
}

// Inverse Transform
public extension MKAffineTransform where Float == CGFloat {
    @inlinable func inverse(_ point: CGPoint) -> CGPoint {
        .init(inverse(MKPoint(point)))
    }
}
