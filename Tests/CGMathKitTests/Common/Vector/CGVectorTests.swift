//
//  Created by Vitali Kurlovich on 30.12.25.
//

import CGMathKit
import CoreGraphics
import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

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

extension CGVectorTests {
    @Test("Constructor <Double>")
    func constructorDouble() {
        let vc = MKVector<Double>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<Double>(cg)

        #expect(vc.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <CGFloat>")
    func constructorCGFloat() {
        let vc = MKVector<CGFloat>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<CGFloat>(cg)

        #expect(vc.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <Float>")
    func constructorFloat() {
        let vc = MKVector<Float>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<Float>(cg)

        #expect(vc.isEqual(to: conv, tolerance: halfTolerance))
    }

    @Test("Constructor <Float16>")
    func constructorFloat16() {
        let vc = MKVector<Float16>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<Float16>(cg)

        #expect(vc.isEqual(to: conv, tolerance: lowTolerance))
    }
}

extension CGVectorTests {
    @Test("Convert to CGVector")
    func convert() {
        let vector = MKVector<Double>(dx: 10.0, dy: 20.0)
        let cgVector = CGVector(CGPoint(x: 20.0, y: 10.0))

        #expect(CGVector(vector) == .init(dx: 10.0, dy: 20.0))
        #expect(MKVector(cgVector) == .init(dx: 20.0, dy: 10.0))
    }
}
