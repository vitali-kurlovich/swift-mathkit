//
//  TransformTest.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import MathKit
import Testing

import struct CoreFoundation.CGPoint

private let tolerance: Double = 0.0000001

@Test("Zero transform")
func zeroTransform() {
    let p0 = CGPoint(x: 0, y: 0)
    let p1 = CGPoint(x: 1, y: 0)
    let p2 = CGPoint(x: 1, y: 1)
    let p3 = CGPoint(x: 0, y: 1)

    #expect(
        transform(p0: p0, p1: p1, p2: p2, p3: p3,
                  uv: CGPoint(x: 0, y: 0))
            .isEqual(to: CGPoint(x: 0, y: 0), tolerance: tolerance)
    )

    #expect(
        transform(p0: p0, p1: p1, p2: p2, p3: p3,
                  uv: CGPoint(x: 1, y: 0))
            .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
    )

    #expect(
        transform(p0: p0, p1: p1, p2: p2, p3: p3,
                  uv: CGPoint(x: 1, y: 1))
            .isEqual(to: CGPoint(x: 1, y: 1), tolerance: tolerance)
    )

    #expect(
        transform(p0: p0, p1: p1, p2: p2, p3: p3,
                  uv: CGPoint(x: 1, y: 0))
            .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
    )

    #expect(
        transform(p0: p0, p1: p1, p2: p2, p3: p3,
                  uv: CGPoint(x: 0.5, y: 0.5))
            .isEqual(to: CGPoint(x: 0.5, y: 0.5), tolerance: tolerance)
    )

    #expect(
        transform(p0: p0, p1: p1, p2: p2, p3: p3,
                  uv: CGPoint(x: 0.25, y: 0.75))
            .isEqual(to: CGPoint(x: 0.25, y: 0.75), tolerance: tolerance)
    )
}
