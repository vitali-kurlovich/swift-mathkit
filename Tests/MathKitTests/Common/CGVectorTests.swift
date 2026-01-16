//
//  CGVectorTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 30.12.25.
//

import Foundation
import MathKit
import Testing

#if canImport(CoreGraphics)
    import CoreGraphics

    private let tolerance: Double = 0.0000001

    @Suite("CGVector")
    struct CGVectorTests {
        @Test("AdditiveArithmetic")
        func additiveArithmetic() {
            var left = CGVector(dx: 5, dy: 6)
            var right = CGVector(dx: 10, dy: 20)

            #expect(
                (left + right).isEqual(to: .init(dx: 15, dy: 26), tolerance: tolerance)
            )

            #expect(
                (left - right).isEqual(to: .init(dx: -5, dy: -14), tolerance: tolerance)
            )

            left += .init(dx: 20, dy: 30)

            #expect(
                left.isEqual(to: .init(dx: 25, dy: 36), tolerance: tolerance)
            )

            right -= .init(dx: 20, dy: 30)

            #expect(
                right.isEqual(to: .init(dx: -10, dy: -10), tolerance: tolerance)
            )
        }

        @Test("Arithmetic")
        func arithmetic() {
            let left = CGVector(dx: 5, dy: 6)

            #expect(
                (-left).isEqual(to: .init(dx: -5, dy: -6), tolerance: tolerance)
            )
        }

        @Test("Scalar")
        func scalar() {
            let left = CGVector(dx: 5, dy: 6)

            #expect(
                (left * 2).isEqual(to: .init(dx: 10, dy: 12), tolerance: tolerance)
            )

            #expect(
                (2 * left).isEqual(to: left * 2, tolerance: tolerance)
            )

            #expect(
                (left / 2).isEqual(to: .init(dx: 2.5, dy: 3), tolerance: tolerance)
            )
        }
    }

#endif // canImport(CoreGraphics)
