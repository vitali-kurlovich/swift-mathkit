//
//  LerpTest.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import MathKit
import Testing

private let tolerance: Double = 0.0000001

@Test("Scalar lerp")
func scalarLerp() {
    #expect(lerp(2.0, 16.0, t: 0.0).isEqual(to: 2.0, tolerance: tolerance))

    #expect(lerp(2.0, 16.0, t: 1.0).isEqual(to: 16.0, tolerance: tolerance))

    #expect(lerp(2.0, 16.0, t: 0.5).isEqual(to: 9.0, tolerance: tolerance))
}
