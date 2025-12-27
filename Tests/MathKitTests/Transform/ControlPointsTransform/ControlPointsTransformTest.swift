//
//  ControlPointsTransformTest.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import MathKit
import Testing

import struct CoreFoundation.CGPoint

private let tolerance: Double = 0.0001

@Suite("ControlPointsTransform Transform")
struct ControlPointsTransformTests {
    @Test("Normalized points")
    func normalized() {
        let p0 = CGPoint(x: 0, y: 0), t0 = UnitPoint(x: 0, y: 0)
        let p1 = CGPoint(x: 1, y: 0), t1 = UnitPoint(x: 1, y: 0)
        let p2 = CGPoint(x: 1, y: 1), t2 = UnitPoint(x: 1, y: 1)
        let p3 = CGPoint(x: 0, y: 1), t3 = UnitPoint(x: 0, y: 1)

        let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

        #expect(
            tr.transform(t0).isEqual(to: p0, tolerance: tolerance)
        )

        #expect(
            tr.transform(t1).isEqual(to: p1, tolerance: tolerance)
        )

        #expect(
            tr.transform(t2).isEqual(to: p2, tolerance: tolerance)
        )

        #expect(
            tr.transform(t3).isEqual(to: p3, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.5, y: 0.5)).isEqual(to: CGPoint(x: 0.5, y: 0.5), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.25, y: 0.75)).isEqual(to: CGPoint(x: 0.25, y: 0.75), tolerance: tolerance)
        )
    }

    @Test("Random points")
    func random() {
        let p0 = CGPoint(x: -10, y: -20)
        let p1 = CGPoint(x: 10, y: -10)
        let p2 = CGPoint(x: 15, y: 20)
        let p3 = CGPoint(x: -20, y: 15)

        let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

        #expect(
            tr.transform(.init(x: 0, y: 0))
                .isEqual(to: p0, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 1, y: 0))
                .isEqual(to: p1, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 1, y: 1))
                .isEqual(to: p2, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0, y: 1))
                .isEqual(to: p3, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.5, y: 0.5))
                .isEqual(to: CGPoint(x: -1.25, y: 1.25), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.25, y: 0.5))
                .isEqual(to: CGPoint(x: -8.125, y: -0.625), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.25, y: 0.75))
                .isEqual(to: CGPoint(x: -9.6875, y: 7.8125), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.5, y: 0.75))
                .isEqual(to: CGPoint(x: -1.875, y: 9.375), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.75, y: 0.25))
                .isEqual(to: CGPoint(x: 5.3125, y: -4.6875), tolerance: tolerance)
        )
    }
}
