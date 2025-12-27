//
//  LerpTest.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import MathKit
import Testing

import struct CoreFoundation.CGFloat
import struct CoreFoundation.CGPoint
import struct CoreFoundation.CGVector

private let tolerance: Double = 0.0000001

@Suite("Lerp Test Cases")
struct LerpTests {
    @Test("Scalar")
    func scalar() {
        #expect(lerp(2.0, 16.0, t: 0.0).isEqual(to: 2.0, tolerance: tolerance))

        #expect(lerp(2.0, 16.0, t: 1.0).isEqual(to: 16.0, tolerance: tolerance))

        #expect(lerp(2.0, 16.0, t: 0.5).isEqual(to: 9.0, tolerance: tolerance))
    }

    @Test("CGPoint")
    func point() {
        #expect(lerp(CGPoint(x: 10, y: 20),
                     CGPoint(x: 60, y: 80), t: 0.0)
                .isEqual(to: CGPoint(x: 10, y: 20), tolerance: tolerance))

        #expect(lerp(CGPoint(x: 10, y: 20),
                     CGPoint(x: 60, y: 80), t: 1.0)
                .isEqual(to: CGPoint(x: 60, y: 80), tolerance: tolerance))

        #expect(lerp(CGPoint(x: 10, y: 20),
                     CGPoint(x: 60, y: 80), t: 0.5)
                .isEqual(to: CGPoint(x: 35, y: 50), tolerance: tolerance))
    }

    @Test("CGVector")
    func vector() {
        #expect(lerp(CGVector(dx: 10, dy: 20),
                     CGVector(dx: 60, dy: 80), t: 0.0)
                .isEqual(to: CGVector(dx: 10, dy: 20), tolerance: tolerance))

        #expect(lerp(CGVector(dx: 10, dy: 20),
                     CGVector(dx: 60, dy: 80), t: 1.0)
                .isEqual(to: CGVector(dx: 60, dy: 80), tolerance: tolerance))

        #expect(lerp(CGVector(dx: 10, dy: 20),
                     CGVector(dx: 60, dy: 80), t: 0.5)
                .isEqual(to: CGVector(dx: 35, dy: 50), tolerance: tolerance))
    }

    @Test("UnitPoint")
    func unitPoint() {
        #expect(lerp(UnitPoint(x: 0, y: 0),
                     UnitPoint(x: 1, y: 1), t: 0.0)
                .isEqual(to: UnitPoint(x: 0, y: 0), tolerance: tolerance))

        #expect(lerp(UnitPoint(x: 0, y: 0),
                     UnitPoint(x: 1, y: 1), t: 1.0)
                .isEqual(to: UnitPoint(x: 1, y: 1), tolerance: tolerance))

        #expect(lerp(UnitPoint(x: 0, y: 0),
                     UnitPoint(x: 1, y: 1), t: 0.5)
                .isEqual(to: UnitPoint(x: 0.5, y: 0.5), tolerance: tolerance))

        #expect(lerp(UnitPoint(x: 0.25, y: 0.75),
                     UnitPoint(x: 0.75, y: 0.25), t: 0.5)
                .isEqual(to: UnitPoint(x: 0.5, y: 0.5), tolerance: tolerance))
    }
}
