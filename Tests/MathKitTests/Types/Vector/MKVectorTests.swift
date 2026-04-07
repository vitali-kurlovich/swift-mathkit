//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("MKVector")
struct MKVectorTests {}

#if canImport(CoreGraphics)
    import CoreGraphics

    extension MKVectorTests {
        @Test("Constructor <Double>")
        func constructorDouble() throws {
            let vc = MKVector<Double>(dx: 2, dy: 3)
            let cg = CGVector(vc)
            let conv = MKVector<Double>(cg)

            #expect(vc.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <CGFloat>")
        func constructorCGFloat() throws {
            let vc = MKVector<CGFloat>(dx: 2, dy: 3)
            let cg = CGVector(vc)
            let conv = MKVector<CGFloat>(cg)

            #expect(vc.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <Float>")
        func constructorFloat() throws {
            let vc = MKVector<Float>(dx: 2, dy: 3)
            let cg = CGVector(vc)
            let conv = MKVector<Float>(cg)

            #expect(vc.isEqual(to: conv, tolerance: halfTolerance))
        }

        @Test("Constructor <Float16>")
        func constructorFloat16() throws {
            let vc = MKVector<Float16>(dx: 2, dy: 3)
            let cg = CGVector(vc)
            let conv = MKVector<Float16>(cg)

            #expect(vc.isEqual(to: conv, tolerance: lowTolerance))
        }
    }

#endif

extension MKVectorTests {
    @Test("Zero")
    func zero() throws {
        #expect(MKVector<Double>.zero.dx == 0)
        #expect(MKVector<Double>.zero.dy == 0)
    }

    @Test("Identity")
    func identity() throws {
        #expect(MKVector<Double>.identity.dx == 1)
        #expect(MKVector<Double>.identity.dy == 1)
    }
}

extension MKVectorTests {
    @Test("Negative",
          arguments: [
              (MKVector<Double>.zero, MKVector<Double>.zero),
              (MKVector<Double>.identity, MKVector<Double>(dx: -1, dy: -1)),
              (MKVector<Double>(dx: -2, dy: -3), MKVector<Double>(dx: 2, dy: 3)),
          ])
    func negative(_ args: (MKVector<Double>, MKVector<Double>)) throws {
        let (vec, expect) = args
        #expect((-vec).isEqual(to: expect, tolerance: tolerance))
        var mv = vec
        mv.negate()
        #expect(mv.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKVectorTests {
    @Test("Addittion <Double>",
          arguments: [
              (MKVector<Double>.zero, MKVector<Double>.zero, MKVector<Double>.zero),
              (MKVector<Double>.zero, MKVector<Double>.identity, MKVector<Double>.identity),
              (MKVector<Double>.identity, MKVector<Double>.zero, MKVector<Double>.identity),

              (MKVector<Double>(dx: 4, dy: 5), MKVector<Double>.zero, MKVector<Double>(dx: 4, dy: 5)),
              (MKVector<Double>(dx: 4, dy: 5), MKVector<Double>(dx: 10, dy: 20), MKVector<Double>(dx: 14, dy: 25)),

          ])
    func addDouble(_ args: (MKVector<Double>, MKVector<Double>, MKVector<Double>)) throws {
        let (vec, add, expect) = args

        #expect((vec + add).isEqual(to: expect, tolerance: tolerance))

        var mv = vec
        mv += add
        #expect(mv.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Substraction <Double>",
          arguments: [
              (MKVector<Double>.zero, MKVector<Double>.zero, MKVector<Double>.zero),
              (MKVector<Double>.identity, MKVector<Double>.zero, MKVector<Double>.identity),
              (MKVector<Double>.zero, MKVector<Double>.identity, -MKVector<Double>.identity),

              (MKVector<Double>(dx: 4, dy: 5), MKVector<Double>.zero, MKVector<Double>(dx: 4, dy: 5)),
              (MKVector<Double>(dx: 4, dy: 5), MKVector<Double>(dx: 10, dy: 20), MKVector<Double>(dx: -6, dy: -15)),
          ])
    func subDouble(_ args: (MKVector<Double>, MKVector<Double>, MKVector<Double>)) throws {
        let (vec, sub, expect) = args

        #expect((vec - sub).isEqual(to: expect, tolerance: tolerance))

        var mv = vec
        mv -= sub
        #expect(mv.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKVectorTests {
    @Test("Multiply Scalar <Double>", arguments: [
        (MKVector<Double>.zero, 0, MKVector<Double>.zero),
        (MKVector<Double>.identity, 0, MKVector<Double>.zero),

        (MKVector<Double>.zero, 1, MKVector<Double>.zero),
        (MKVector<Double>.identity, 1, MKVector<Double>.identity),

        (MKVector<Double>(dx: 4, dy: 8), 1, MKVector<Double>(dx: 4, dy: 8)),
        (MKVector<Double>(dx: 4, dy: 8), -1, MKVector<Double>(dx: -4, dy: -8)),

        (MKVector<Double>(dx: 4, dy: 8), 10, MKVector<Double>(dx: 40, dy: 80)),
        (MKVector<Double>(dx: 4, dy: 8), -10, MKVector<Double>(dx: -40, dy: -80)),

    ])
    func mulScalarDouble(_ args: (MKVector<Double>, Double, MKVector<Double>)) throws {
        let (pt, scalar, expect) = args

        #expect((pt * scalar).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp *= scalar
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Multiply <Double>", arguments: [
        (MKVector<Double>.zero, MKVector<Double>.zero, MKVector<Double>.zero),
        (MKVector<Double>.identity, MKVector<Double>.zero, MKVector<Double>.zero),

        (MKVector<Double>.zero, MKVector<Double>.identity, MKVector<Double>.zero),
        (MKVector<Double>.identity, MKVector<Double>.identity, MKVector<Double>.identity),

        (MKVector<Double>(dx: 4, dy: 8), MKVector<Double>.identity, MKVector<Double>(dx: 4, dy: 8)),
        (MKVector<Double>(dx: 4, dy: 8), -MKVector<Double>.identity, MKVector<Double>(dx: -4, dy: -8)),

        (MKVector<Double>(dx: 4, dy: 8), MKVector<Double>(dx: 10, dy: 20), MKVector<Double>(dx: 40, dy: 160)),
        (MKVector<Double>(dx: 4, dy: 8), MKVector<Double>(dx: -10, dy: -20), MKVector<Double>(dx: -40, dy: -160)),

    ])
    func mulDouble(_ args: (MKVector<Double>, MKVector<Double>, MKVector<Double>)) throws {
        let (pt, mul, expect) = args

        #expect((pt * mul).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp *= mul
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Add Product <Double>", arguments: [
        (MKVector<Double>.zero, MKVector<Double>.zero, MKVector<Double>.zero, MKVector<Double>.zero),
        (MKVector<Double>.zero, MKVector<Double>.identity, MKVector<Double>.zero, MKVector<Double>.zero),

        (MKVector<Double>.identity, MKVector<Double>.zero, MKVector<Double>.zero, MKVector<Double>.identity),

        (MKVector<Double>(dx: 2, dy: 3), MKVector<Double>(dx: 3, dy: 4), MKVector<Double>(dx: 10, dy: 5), MKVector<Double>(dx: 32, dy: 23)),

    ])
    func addProductDouble(_ args: (MKVector<Double>, MKVector<Double>, MKVector<Double>, MKVector<Double>)) {
        let (base, left, right, expect) = args

        #expect(
            base.addingProduct(left, right).isEqual(to: expect, tolerance: tolerance)
        )

        var mbase = base
        mbase.addProduct(left, right)

        #expect(
            mbase.isEqual(to: expect, tolerance: tolerance)
        )
    }
}

extension MKVectorTests {
    @Test("Divide Scalar <Double>", arguments: [
        (MKVector<Double>.zero, 1, MKVector<Double>.zero),
        (MKVector<Double>.identity, 1, MKVector<Double>.identity),

        (MKVector<Double>(dx: 4, dy: 8), 1, MKVector<Double>(dx: 4, dy: 8)),
        (MKVector<Double>(dx: 4, dy: 8), -1, MKVector<Double>(dx: -4, dy: -8)),

        (MKVector<Double>(dx: 4, dy: 8), 10, MKVector<Double>(dx: 0.4, dy: 0.8)),
        (MKVector<Double>(dx: 4, dy: 8), -10, MKVector<Double>(dx: -0.4, dy: -0.8)),

    ])
    func divScalarDouble(_ args: (MKVector<Double>, Double, MKVector<Double>)) throws {
        let (pt, scalar, expect) = args

        #expect((pt / scalar).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp /= scalar
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Divide <Double>", arguments: [
        (MKVector<Double>.zero, MKVector<Double>.identity, MKVector<Double>.zero),
        (MKVector<Double>.identity, MKVector<Double>.identity, MKVector<Double>.identity),

        (MKVector<Double>(dx: 4, dy: 8), MKVector<Double>.identity, MKVector<Double>(dx: 4, dy: 8)),
        (MKVector<Double>(dx: 4, dy: 8), -MKVector<Double>.identity, MKVector<Double>(dx: -4, dy: -8)),

        (MKVector<Double>(dx: 4, dy: 8), MKVector<Double>(dx: 2, dy: 4), MKVector<Double>(dx: 2, dy: 2)),
        (MKVector<Double>(dx: 4, dy: 8), MKVector<Double>(dx: -2, dy: -4), MKVector<Double>(dx: -2, dy: -2)),

    ])
    func divDouble(_ args: (MKVector<Double>, MKVector<Double>, MKVector<Double>)) throws {
        let (pt, divider, expect) = args

        #expect((pt / divider).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp /= divider
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKVectorTests {
    @Test("Magnitude <Double>", arguments: [
        (MKVector<Double>.zero, 0),

        (MKVector<Double>(dx: 0, dy: 1), 1),
        (MKVector<Double>(dx: 1, dy: 0), 1),

        (MKVector<Double>(dx: 0, dy: -1), 1),
        (MKVector<Double>(dx: -1, dy: 0), 1),

        (MKVector<Double>(dx: 0, dy: 5), 5),
        (MKVector<Double>(dx: 5, dy: 0), 5),

        (MKVector<Double>(dx: 0, dy: -5), 5),
        (MKVector<Double>(dx: -5, dy: 0), 5),

        (MKVector<Double>(dx: 3, dy: 4), 5),
        (MKVector<Double>(dx: -3, dy: -4), 5),
        (MKVector<Double>(dx: 3, dy: -4), 5),
        (MKVector<Double>(dx: -3, dy: 4), 5),
    ])
    func magnitudeDouble(_ args: (MKVector<Double>, Double)) {
        let (pt, expect) = args

        #expect(pt.magnitudeSquared.isEqual(to: expect * expect, tolerance: tolerance))
        #expect(pt.magnitude.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKVectorTests {
    @Test("Normalize", arguments: [
        (MKVector<Double>.identity, MKVector<Double>(dx: 0.7071067812, dy: 0.7071067812)),
        (MKVector<Double>(dx: 0.7071067812, dy: 0.7071067812), MKVector<Double>(dx: 0.7071067812, dy: 0.7071067812)),

        (MKVector<Double>(dx: 30, dy: 40), MKVector<Double>(dx: 0.6, dy: 0.8)),
        (MKVector<Double>(dx: -30, dy: 40), MKVector<Double>(dx: -0.6, dy: 0.8)),
        (MKVector<Double>(dx: -30, dy: -40), MKVector<Double>(dx: -0.6, dy: -0.8)),
        (MKVector<Double>(dx: 30, dy: -40), MKVector<Double>(dx: 0.6, dy: -0.8)),
    ])
    func normalizeDouble(_ args: (MKVector<Double>, MKVector<Double>)) {
        let (vec, expect) = args

        #expect(
            vec.normalized().isEqual(to: expect, tolerance: tolerance)
        )

        var mvec = vec
        mvec.normalize()

        #expect(
            mvec.isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            mvec.magnitudeSquared.isEqual(to: 1, tolerance: tolerance)
        )
    }

    @Test("Dot", arguments: [
        (MKVector<Double>(dx: 0, dy: 1), MKVector<Double>(dx: 0, dy: 1), 1.0),
        (MKVector<Double>(dx: 0, dy: -1), MKVector<Double>(dx: 0, dy: 1), -1.0),
        (MKVector<Double>(dx: -6, dy: 3), MKVector<Double>(dx: 5, dy: -2), -36.0),
        (MKVector<Double>(dx: 10, dy: 0), MKVector<Double>(dx: 0, dy: 10), 0.0),
        (MKVector<Double>(dx: 0.8660254038, dy: -0.5), MKVector<Double>(dx: 0.5, dy: 0.8660254038), 0.0),
    ])
    func dot(_ args: (MKVector<Double>, MKVector<Double>, Double)) {
        let (first, second, expect) = args
        #expect(first.dot(second).isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Cross", arguments: [
        (MKVector<Double>(dx: 10, dy: 0), MKVector<Double>(dx: 0, dy: 10), 100.0),
        (MKVector<Double>(dx: 0, dy: 10), MKVector<Double>(dx: 10, dy: 0), -100.0),
        (MKVector<Double>(dx: 10, dy: 0), MKVector<Double>(dx: 10, dy: 10), 100.0),
        (MKVector<Double>(dx: 0.8660254038, dy: -0.5), MKVector<Double>(dx: 0.5, dy: 0.8660254038), 1.0),

    ])
    func cross(_ args: (MKVector<Double>, MKVector<Double>, Double)) {
        let (first, second, expect) = args
        #expect(first.cross(second).isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKVectorTests {
    @Test("Rotate <Double>",
          arguments: [
              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: 0.5 * .pi), MKVector<Double>(dx: 0, dy: 1)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: 0.5 * .pi), MKVector<Double>(dx: 0, dy: 2)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: .pi), MKVector<Double>(dx: -1, dy: 0)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: .pi), MKVector<Double>(dx: -2, dy: 0)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: 1.5 * .pi), MKVector<Double>(dx: 0, dy: -1)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: 1.5 * .pi), MKVector<Double>(dx: 0, dy: -2)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: 2 * .pi), MKVector<Double>(dx: 1, dy: 0)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: 2 * .pi), MKVector<Double>(dx: 2, dy: 0)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(degrees: 45), MKVector<Double>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(degrees: 45), MKVector<Double>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(degrees: 60), MKVector<Double>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(degrees: 60), MKVector<Double>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_Double(_ args: (MKVector<Double>, MKAngle<Double>, MKVector<Double>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: tolerance)
        )
    }

    @Test("Rotate <CGFloat>",
          arguments: [
              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: 0.5 * .pi), MKVector<CGFloat>(dx: 0, dy: 1)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: 0.5 * .pi), MKVector<CGFloat>(dx: 0, dy: 2)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: .pi), MKVector<CGFloat>(dx: -1, dy: 0)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: .pi), MKVector<CGFloat>(dx: -2, dy: 0)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: 1.5 * .pi), MKVector<CGFloat>(dx: 0, dy: -1)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: 1.5 * .pi), MKVector<CGFloat>(dx: 0, dy: -2)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: 2 * .pi), MKVector<CGFloat>(dx: 1, dy: 0)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: 2 * .pi), MKVector<CGFloat>(dx: 2, dy: 0)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(degrees: 45), MKVector<CGFloat>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(degrees: 45), MKVector<CGFloat>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(degrees: 60), MKVector<CGFloat>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(degrees: 60), MKVector<CGFloat>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_CGFloat(_ args: (MKVector<CGFloat>, MKAngle<CGFloat>, MKVector<CGFloat>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: tolerance)
        )
    }

    @Test("Rotate <Float>",
          arguments: [
              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: 0.5 * .pi), MKVector<Float>(dx: 0, dy: 1)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: 0.5 * .pi), MKVector<Float>(dx: 0, dy: 2)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: .pi), MKVector<Float>(dx: -1, dy: 0)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: .pi), MKVector<Float>(dx: -2, dy: 0)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: 1.5 * .pi), MKVector<Float>(dx: 0, dy: -1)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: 1.5 * .pi), MKVector<Float>(dx: 0, dy: -2)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: 2 * .pi), MKVector<Float>(dx: 1, dy: 0)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: 2 * .pi), MKVector<Float>(dx: 2, dy: 0)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(degrees: 45), MKVector<Float>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(degrees: 45), MKVector<Float>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(degrees: 60), MKVector<Float>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(degrees: 60), MKVector<Float>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_Float(_ args: (MKVector<Float>, MKAngle<Float>, MKVector<Float>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: halfTolerance)
        )
    }

    @Test("Rotate <Float16>",
          arguments: [
              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: 0.5 * .pi), MKVector<Float16>(dx: 0, dy: 1)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: 0.5 * .pi), MKVector<Float16>(dx: 0, dy: 2)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: .pi), MKVector<Float16>(dx: -1, dy: 0)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: .pi), MKVector<Float16>(dx: -2, dy: 0)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: 1.5 * .pi), MKVector<Float16>(dx: 0, dy: -1)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: 1.5 * .pi), MKVector<Float16>(dx: 0, dy: -2)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: 2 * .pi), MKVector<Float16>(dx: 1, dy: 0)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: 2 * .pi), MKVector<Float16>(dx: 2, dy: 0)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(degrees: 45), MKVector<Float16>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(degrees: 45), MKVector<Float16>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(degrees: 60), MKVector<Float16>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(degrees: 60), MKVector<Float16>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_Float16(_ args: (MKVector<Float16>, MKAngle<Float16>, MKVector<Float16>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: lowTolerance)
        )
    }
}

#if canImport(CoreGraphics)

    import CoreGraphics

    extension MKVectorTests {
        @Test("Convert to CGVector")
        func convert() throws {
            let vector = MKVector<Double>(dx: 10.0, dy: 20.0)
            let cgVector = CGVector(CGPoint(x: 20.0, y: 10.0))

            #expect(CGVector(vector) == .init(dx: 10.0, dy: 20.0))
            #expect(MKVector(cgVector) == .init(dx: 20.0, dy: 10.0))
        }
    }

#endif // canImport(CoreGraphics)
