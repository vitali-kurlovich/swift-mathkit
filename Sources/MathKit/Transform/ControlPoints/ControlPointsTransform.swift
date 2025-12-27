//
//  ControlPointsTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

public struct ControlPointsTransform: Hashable {
    public var p0: CGPoint
    public var p1: CGPoint
    public var p2: CGPoint
    public var p3: CGPoint

    public init(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint) {
        self.p0 = p0
        self.p1 = p1
        self.p2 = p2
        self.p3 = p3
    }
}
