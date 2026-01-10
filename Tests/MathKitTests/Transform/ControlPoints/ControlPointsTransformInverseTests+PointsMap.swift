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

        init(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint, transform: CoreAffineTransform = .identity) {
            self.p0 = transform.transform(p0)
            self.p1 = transform.transform(p1)
            self.p2 = transform.transform(p2)
            self.p3 = transform.transform(p3)
        }
    }
}

extension ControlPointsTransformInverseTests.PointsMap {
    init(_ p0: (CGFloat, CGFloat), _ p1: (CGFloat, CGFloat), _ p2: (CGFloat, CGFloat), _ p3: (CGFloat, CGFloat), _ transform: CoreAffineTransform = .identity) {
        self.init(p0: CGPoint(x: p0.0, y: p0.1),
                  p1: CGPoint(x: p1.0, y: p1.1),
                  p2: CGPoint(x: p2.0, y: p2.1),
                  p3: CGPoint(x: p3.0, y: p3.1),
                  transform: transform)
    }
}

extension ControlPointsTransformInverseTests {
    enum UVGrid {
        nonisolated static let u: [CGFloat] = [0.0, 0.25, 0.5, 0.75, 1.0]
        nonisolated static let v: [CGFloat] = [0.0, 0.25, 0.5, 0.75, 1.0]

        static var uvs: [UnitPoint] {
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
