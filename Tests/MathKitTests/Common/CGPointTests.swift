//
//  CGPointTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001

@Suite("CGPoint")
struct CGPointTests {
    @Test("AdditiveArithmetic")
    func additiveArithmetic() {
        var left = CGPoint(x: 5, y: 6)
        var right = CGPoint(x: 10, y: 20)

        #expect(
            (left + right).isEqual(to: .init(x: 15, y: 26), tolerance: tolerance)
        )

        #expect(
            (left - right).isEqual(to: .init(x: -5, y: -14), tolerance: tolerance)
        )

        left += .init(x: 20, y: 30)

        #expect(
            left.isEqual(to: .init(x: 25, y: 36), tolerance: tolerance)
        )

        right -= .init(x: 20, y: 30)

        #expect(
            right.isEqual(to: .init(x: -10, y: -10), tolerance: tolerance)
        )
    }

    @Test("Arithmetic")
    func arithmetic() {
        let left = CGPoint(x: 5, y: 6)

        #expect(
            (-left).isEqual(to: .init(x: -5, y: -6), tolerance: tolerance)
        )
    }

    @Test("Scalar")
    func scalar() {
        let left = CGPoint(x: 5, y: 6)

        #expect(
            (left * 2).isEqual(to: .init(x: 10, y: 12), tolerance: tolerance)
        )

        #expect(
            (2 * left).isEqual(to: left * 2, tolerance: tolerance)
        )

        #expect(
            (left / 2).isEqual(to: .init(x: 2.5, y: 3), tolerance: tolerance)
        )
    }

    @Test("Size")
    func size() {
        var point = CGPoint(x: 5, y: 6)
        let size = CGSize(width: 10, height: 20)

        #expect(
            (point + size).isEqual(to: CGPoint(x: 15, y: 26), tolerance: tolerance)
        )

        #expect(
            (point - size).isEqual(to: CGPoint(x: -5, y: -14), tolerance: tolerance)
        )

        point += size

        #expect(
            point.isEqual(to: CGPoint(x: 15, y: 26), tolerance: tolerance)
        )

        point -= size

        #expect(
            point.isEqual(to: CGPoint(x: 5, y: 6), tolerance: tolerance)
        )
    }
}

#if canImport(CoreGraphics)

    extension CGPointTests {
        @Test("Vector")
        func vector() {
            let point = CGPoint(x: 5, y: 6)

            let vector = CGVector(CGPoint(x: 10, y: 20))

            #expect(
                CGPoint(vector).isEqual(to: CGPoint(x: 10, y: 20), tolerance: tolerance)
            )

            #expect(
                (point + vector).isEqual(to: CGPoint(x: 15, y: 26), tolerance: tolerance)
            )

            #expect(
                (vector + point).isEqual(to: CGPoint(x: 15, y: 26), tolerance: tolerance)
            )
        }
    }

#endif // canImport(CoreGraphics)
