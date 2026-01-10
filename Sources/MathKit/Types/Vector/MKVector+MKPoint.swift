//
//  MKVector+MKPoint.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public extension MKVector {
    @inlinable init(_ point: MKPoint<Float>) {
        self.init(dx: point.x, dy: point.y)
    }
}
