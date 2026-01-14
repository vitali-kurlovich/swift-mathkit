//
//  CGVector+CGPoint.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 30.12.25.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public extension CGVector {
        @inlinable init(_ point: CGPoint) {
            self.init(dx: point.x, dy: point.y)
        }
    }

#endif // canImport(CoreGraphics)
