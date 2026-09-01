//
//  Created by Vitali Kurlovich on 29.12.25.
//

import CGMathKit
import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

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

extension CGPointTests {
    @Test("Constructor <Double>", arguments: [
        MKPoint<Double>.zero,
        MKPoint<Double>.identity,
        -MKPoint<Double>.identity,
        MKPoint<Double>(x: 0, y: 1),
        MKPoint<Double>(x: 1, y: 0),
        MKPoint<Double>(x: 4, y: 8),
        MKPoint<Double>(x: -4, y: 8),
        MKPoint<Double>(x: 4, y: -8),
    ])
    func constructorDouble(_ pt: MKPoint<Double>) {
        let point = CGPoint(pt)
        let conv = MKPoint<Double>(point)

        #expect(pt.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <CGFloat>", arguments: [
        MKPoint<CGFloat>.zero,
        MKPoint<CGFloat>.identity,
        -MKPoint<CGFloat>.identity,
        MKPoint<CGFloat>(x: 0, y: 1),
        MKPoint<CGFloat>(x: 1, y: 0),
        MKPoint<CGFloat>(x: 4, y: 8),
        MKPoint<CGFloat>(x: -4, y: 8),
        MKPoint<CGFloat>(x: 4, y: -8),
    ])
    func constructorCGFloat(_ pt: MKPoint<CGFloat>) {
        let point = CGPoint(pt)
        let conv = MKPoint<CGFloat>(point)

        #expect(pt.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <Float>", arguments: [
        MKPoint<Float>.zero,
        MKPoint<Float>.identity,
        -MKPoint<Float>.identity,
        MKPoint<Float>(x: 0, y: 1),
        MKPoint<Float>(x: 1, y: 0),
        MKPoint<Float>(x: 4, y: 8),
        MKPoint<Float>(x: -4, y: 8),
        MKPoint<Float>(x: 4, y: -8),
    ])
    func constructorFloat(_ pt: MKPoint<Float>) {
        let point = CGPoint(pt)
        let conv = MKPoint<Float>(point)

        #expect(pt.isEqual(to: conv, tolerance: halfTolerance))
    }

    @Test("Constructor <Float16>", arguments: [
        MKPoint<Float16>.zero,
        MKPoint<Float16>.identity,
        -MKPoint<Float16>.identity,
        MKPoint<Float16>(x: 0, y: 1),
        MKPoint<Float16>(x: 1, y: 0),
        MKPoint<Float16>(x: 4, y: 8),
        MKPoint<Float16>(x: -4, y: 8),
        MKPoint<Float16>(x: 4, y: -8),
    ])
    func constructorFloat16(_ pt: MKPoint<Float16>) {
        let point = CGPoint(pt)
        let conv = MKPoint<Float16>(point)

        #expect(pt.isEqual(to: conv, tolerance: lowTolerance))
    }
}

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
