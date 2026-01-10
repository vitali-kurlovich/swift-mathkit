//
//  MKRect+Bounds.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public extension MKRect {
    static func bounds(_ p0: MKPoint<Float>, _ p1: MKPoint<Float>, _ p2: MKPoint<Float>, _ p3: MKPoint<Float>) -> Self {
        let minX = min(p0.x, p1.x, p2.x, p3.x)
        let maxX = max(p0.x, p1.x, p2.x, p3.x)

        let minY = min(p0.y, p1.y, p2.y, p3.y)
        let maxY = max(p0.y, p1.y, p2.y, p3.y)

        return .init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
