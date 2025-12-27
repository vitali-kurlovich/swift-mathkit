//
//  InverseTransformTests+PointsMap.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

@testable import MathKit

import struct CoreFoundation.CGFloat
import struct CoreFoundation.CGPoint

extension ControlPointsTransformInverseTests {
    struct PointsMap {
        let p0: CGPoint
        let p1: CGPoint
        let p2: CGPoint
        let p3: CGPoint
    }
}

extension ControlPointsTransformInverseTests.PointsMap {
    var t0: CGPoint { CGPoint(x: 0, y: 0) }
    var t1: CGPoint { CGPoint(x: 1, y: 0) }
    var t2: CGPoint { CGPoint(x: 1, y: 1) }
    var t3: CGPoint { CGPoint(x: 0, y: 1) }
}

extension ControlPointsTransformInverseTests.PointsMap {
    var pc: CGPoint {
        transform(uv: tc)
    }

    var tc: CGPoint { CGPoint(x: 0.5, y: 0.5) }

    var uvGrid: [(uv: CGPoint, transformed: CGPoint)] {
        UVGrid.uv.map { uv in
            (uv: uv, transformed: transform(uv: uv))
        }
    }
}

extension ControlPointsTransformInverseTests.PointsMap {
    func transform(uv: CGPoint) -> CGPoint {
        MathKit.transform(p0: p0, p1: p1, p2: p2, p3: p3, uv: uv)
    }
}

extension ControlPointsTransformInverseTests.PointsMap {
    init(_ p0: (CGFloat, CGFloat), _ p1: (CGFloat, CGFloat), _ p2: (CGFloat, CGFloat), _ p3: (CGFloat, CGFloat)) {
        self.init(p0: CGPoint(x: p0.0, y: p0.1),
                  p1: CGPoint(x: p1.0, y: p1.1),
                  p2: CGPoint(x: p2.0, y: p2.1),
                  p3: CGPoint(x: p3.0, y: p3.1))
    }
}

extension ControlPointsTransformInverseTests.PointsMap {
    enum UVGrid {
        nonisolated static let u: [CGFloat] = [0.0, 0.25, 0.5, 0.75, 1.0]
        nonisolated static let v: [CGFloat] = [0.0, 0.25, 0.5, 0.75, 1.0]

        static var uv: [CGPoint] {
            var map: [CGPoint] = []
            map.reserveCapacity(Self.u.count * Self.v.count)

            for u in Self.u {
                for v in Self.v {
                    map.append(CGPoint(x: u, y: v))
                }
            }
            return map
        }
    }
}
