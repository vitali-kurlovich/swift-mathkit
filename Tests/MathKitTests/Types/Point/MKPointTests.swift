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

        var point = Point(x: 3, y: 4)

        point *= Point(x: 2, y: 3)

        #expect(
            point.isEqual(to: .init(x: 6, y: 12), tolerance: tolerance)
        )

        point *= 2

        #expect(
            point.isEqual(to: .init(x: 12, y: 24), tolerance: tolerance)
        )

        point /= 2

        #expect(
            point.isEqual(to: .init(x: 6, y: 12), tolerance: tolerance)
        )

        point /= Point(x: 2, y: 3)

        #expect(
            point.isEqual(to: .init(x: 3, y: 4), tolerance: tolerance)
        )
    }

    @Test("Add Product")
    func addProduct() {
        var point = Point(x: 3, y: 4)

        #expect(
            point.addingProduct(Point(x: 2, y: 3), Point(x: 6, y: 4)) == Point(x: 15, y: 16)
        )

        point.addProduct(Point(x: 2, y: 3), Point(x: 6, y: 4))

        #expect(point == Point(x: 15, y: 16))
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

    @Test("Magnitude")
    func magnitude() {
        let point = Point(x: 3, y: 4)

        #expect(
            point.magnitudeSquared == 25
        )

        #expect(
            point.magnitude == 5
        )
    }

    @Test("Distance")
    func distance() {
        let point = Point(x: -1, y: -2)

        #expect(
            point.distanceSquared(to: Point(x: 2, y: 2)) == 25
        )

        #expect(
            point.distance(to: Point(x: 2, y: 2)) == 5
        )
    }

    @Test("Normalize")
    func normalize() {
        var point = Point(x: -30, y: 40)

        #expect(
            point.normalized() == Point(x: -3 / 5, y: 4 / 5)
        )

        point.normalize()

        #expect(
            point == Point(x: -3 / 5, y: 4 / 5)
        )

        #expect(
            point.magnitudeSquared == 1
        )
    }

    @Test("Dot")
    func dot() {
        // {{Sqrt[3]/2, -(1/2)}, {1/2, Sqrt[3]/2}}

        #expect(
            Point(x: 0, y: 1).dot(Point(x: 0, y: 1)) == 1
        )

        #expect(
            Point(x: -6, y: 3).dot(Point(x: 5, y: -2)) == -36
        )

        #expect(
            Point(x: 10, y: 0).dot(Point(x: 0, y: 10)) == 0
        )

        #expect(
            Point(x: sqrt(3) / 2, y: -1 / 2).dot(Point(x: 1 / 2, y: sqrt(3) / 2)) == 0
        )
    }

    @Test("Cross")
    func cross() {
        #expect(
            Point(x: 10, y: 0).cross(Point(x: 0, y: 10)) == 100
        )

        #expect(
            Point(x: 0, y: 10).cross(Point(x: 10, y: 0)) == -100
        )

        #expect(
            Point(x: 10, y: 0).cross(Point(x: 10, y: 10)) == 100
        )

        #expect(
            Point(x: sqrt(3) / 2, y: -1 / 2).cross(Point(x: 1 / 2, y: sqrt(3) / 2)).isEqual(to: 1, tolerance: tolerance)
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
