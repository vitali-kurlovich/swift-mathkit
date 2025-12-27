//
//  InverseTest.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import MathKit
import Testing

import struct CoreFoundation.CGPoint

private let tolerance: Double = 0.0001

@Suite("ControlPointsTransform Inverse Transform")
struct ControlPointsTransformInverseTests {
    @Test("Parallel control points", arguments: [
        //         3 -- 2
        //         |    |
        //         0 -- 1
        PointsMap((0, 0), (1, 0), (1, 1), (0, 1)), // 0, 1, 2, 3
        PointsMap((0, 0), (2, 0), (2, 2), (0, 2)),

        //         2 -- 3
        //         |    |
        //         1 -- 0
        PointsMap((1, 0), (0, 0), (0, 1), (1, 1)), // 1, 0, 3, 2
        PointsMap((2, 0), (0, 0), (0, 2), (2, 2)),

        //         0 -- 1
        //         |    |
        //         3 -- 2
        PointsMap((0, 1), (1, 1), (1, 0), (0, 0)), // 3, 2, 1, 0
        PointsMap((0, 2), (2, 2), (2, 0), (0, 0)),

        //         1 -- 0
        //         |    |
        //         2 -- 3
        PointsMap((1, 1), (0, 1), (0, 0), (1, 0)), // 2, 3, 0, 1
        PointsMap((2, 2), (0, 2), (0, 0), (2, 0)),

        //         0 -- 3
        //         |    |
        //         1 -- 2
        PointsMap((1, 0), (1, 1), (0, 1), (0, 0)), // 1, 2, 3, 0
        PointsMap((2, 0), (2, 2), (0, 2), (0, 0)),

    ])
    func normalized(_ points: PointsMap) {
        for (uv, transformed) in points.uvGrid {
            let tr = ControlPointsTransform(p0: points.p0,
                                            p1: points.p1,
                                            p2: points.p2,
                                            p3: points.p3)

            #expect(
                tr.inverse(transformed).isEqual(to: uv, tolerance: tolerance)
            )
        }
    }

    @Test("Control points", arguments: [
        //         3 -- 2
        //         |    |
        //         0 -- 1
        PointsMap((-10, -20), (10, -10), (15, 20), (-20, 15)), // 0, 1, 2, 3

        //         2 -- 3
        //         |    |
        //         1 -- 0
        PointsMap((10, -10), (-10, -20), (-20, 15), (15, 20)), // 1, 0, 3, 2

        //         0 -- 1
        //         |    |
        //         3 -- 2
        PointsMap((-20, 15), (15, 20), (10, -10), (-10, -20)), // 3, 2, 1, 0

        //         1 -- 0
        //         |    |
        //         2 -- 3
        PointsMap((15, 20), (-20, 15), (-10, -20), (10, -10)), // 2, 3, 0, 1

        //         0 -- 3
        //         |    |
        //         1 -- 2
        PointsMap((10, -10), (15, 20), (-20, 15), (-10, -20)), // 1, 2, 3, 0
    ])
    func random(_ points: PointsMap) {
        for (uv, transformed) in points.uvGrid {
            let tr = ControlPointsTransform(p0: points.p0,
                                            p1: points.p1,
                                            p2: points.p2,
                                            p3: points.p3)

            #expect(
                tr.inverse(transformed).isEqual(to: uv, tolerance: tolerance)
            )
        }
    }
}
