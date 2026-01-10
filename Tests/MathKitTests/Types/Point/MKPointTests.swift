//
//  MKPointTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001

@Suite("MKPoint")
struct MKPointTests {
    typealias Point = MKPoint<Double>
    typealias Vector = MKVector<Double>
    typealias Size = MKSize<Double>

    @Test("Zero")
    func zero() {
        #expect(
            Point.zero.x == 0
        )
        #expect(
            Point.zero.y == 0
        )
    }

    @Test("AdditiveArithmetic")
    func additiveArithmetic() {
        var left = Point(x: 5, y: 6)
        var right = Point(x: 10, y: 20)

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
        let left = Point(x: 5, y: 6)

        #expect(
            (-left).isEqual(to: .init(x: -5, y: -6), tolerance: tolerance)
        )
    }

    @Test("Scalar")
    func scalar() {
        let left = Point(x: 5, y: 6)

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

    @Test("Vector")
    func vector() {
        let point = Point(x: 5, y: 6)

        let vector = Vector(Point(x: 10, y: 20))

        #expect(
            Point(vector).isEqual(to: Point(x: 10, y: 20), tolerance: tolerance)
        )

        #expect(
            (point + vector).isEqual(to: Point(x: 15, y: 26), tolerance: tolerance)
        )

        #expect(
            (vector + point).isEqual(to: Point(x: 15, y: 26), tolerance: tolerance)
        )
    }

    @Test("Size")
    func size() {
        var point = Point(x: 5, y: 6)
        let size = Size(width: 10, height: 20)

        #expect(
            (point + size).isEqual(to: Point(x: 15, y: 26), tolerance: tolerance)
        )

        #expect(
            (point - size).isEqual(to: Point(x: -5, y: -14), tolerance: tolerance)
        )

        point += size

        #expect(
            point.isEqual(to: Point(x: 15, y: 26), tolerance: tolerance)
        )

        point -= size

        #expect(
            point.isEqual(to: Point(x: 5, y: 6), tolerance: tolerance)
        )
    }
}
