//
//  ControlPointsTransformInverseTests+PointsMap.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import Foundation
import MathKit

extension ControlPointsTransformInverseTests {
    struct PointsMap {
        let p0: CGPoint
        let p1: CGPoint
        let p2: CGPoint
        let p3: CGPoint
    }
}

extension ControlPointsTransformInverseTests.PointsMap {
    var uvGrid: [(uv: UnitPoint, transformed: CGPoint)] {
        UVGrid.uv.map { uv in
            (uv: uv, transformed: transform(uv: uv))
        }
    }
}

extension ControlPointsTransformInverseTests.PointsMap {
    func transform(uv: UnitPoint) -> CGPoint {
        let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)
        return tr.transform(uv)
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

        static var uv: [UnitPoint] {
            var map: [UnitPoint] = []
            map.reserveCapacity(Self.u.count * Self.v.count)

            for u in Self.u {
                for v in Self.v {
                    map.append(UnitPoint(x: u, y: v))
                }
            }
            return map
        }
    }
}
