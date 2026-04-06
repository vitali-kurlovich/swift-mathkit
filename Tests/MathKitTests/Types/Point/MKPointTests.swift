//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("MKPoint")
struct MKPointTests {}

extension MKPointTests {
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
    func constructorDouble(_ pt: MKPoint<Double>) throws {
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
    func constructorCGFloat(_ pt: MKPoint<CGFloat>) throws {
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
    func constructorFloat(_ pt: MKPoint<Float>) throws {
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
    func constructorFloat16(_ pt: MKPoint<Float16>) throws {
        let point = CGPoint(pt)
        let conv = MKPoint<Float16>(point)

        #expect(pt.isEqual(to: conv, tolerance: lowTolerance))
    }
}

extension MKPointTests {
    typealias Point = MKPoint<Double>
    typealias Vector = MKVector<Double>
    typealias Size = MKSize<Double>

    @Test("Zero")
    func zero() {
        #expect(MKPoint<Double>.zero.x == 0)
        #expect(MKPoint<Double>.zero.y == 0)
    }

    @Test("Identity")
    func identity() throws {
        #expect(MKPoint<Double>.identity.x == 1)
        #expect(MKPoint<Double>.identity.y == 1)
    }
}

extension MKPointTests {
    @Test("Negative",
          arguments: [
              (MKPoint<Double>.zero, MKPoint<Double>.zero),
              (MKPoint<Double>.identity, MKPoint<Double>(x: -1, y: -1)),
              (MKPoint<Double>(x: -2, y: -3), MKPoint<Double>(x: 2, y: 3)),
          ])
    func negative(_ args: (MKPoint<Double>, MKPoint<Double>)) throws {
        let (pt, expect) = args
        #expect((-pt).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp.negate()
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKPointTests {
    @Test("Addittion <Double>",
          arguments: [
              (MKPoint<Double>.zero, MKPoint<Double>.zero, MKPoint<Double>.zero),
              (MKPoint<Double>.zero, MKPoint<Double>.identity, MKPoint<Double>.identity),
              (MKPoint<Double>.identity, MKPoint<Double>.zero, MKPoint<Double>.identity),

              (MKPoint<Double>(x: 4, y: 5), MKPoint<Double>.zero, MKPoint<Double>(x: 4, y: 5)),
              (MKPoint<Double>(x: 4, y: 5), MKPoint<Double>(x: 10, y: 20), MKPoint<Double>(x: 14, y: 25)),

          ])
    func addDouble(_ args: (MKPoint<Double>, MKPoint<Double>, MKPoint<Double>)) throws {
        let (pt, add, expect) = args

        #expect((pt + add).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp += add
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Addittion Vector <Double>",
          arguments: [
              (MKPoint<Double>.zero, MKVector<Double>.zero, MKPoint<Double>.zero),
              (MKPoint<Double>.zero, MKVector<Double>.identity, MKPoint<Double>.identity),
              (MKPoint<Double>.identity, MKVector<Double>.zero, MKPoint<Double>.identity),

              (MKPoint<Double>(x: 4, y: 5), MKVector<Double>.zero, MKPoint<Double>(x: 4, y: 5)),
              (MKPoint<Double>(x: 4, y: 5), MKVector<Double>(dx: 10, dy: 20), MKPoint<Double>(x: 14, y: 25)),

          ])
    func addVectorDouble(_ args: (MKPoint<Double>, MKVector<Double>, MKPoint<Double>)) throws {
        let (pt, add, expect) = args

        #expect((pt + add).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp += add
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Addittion Size <Double>",
          arguments: [
              (MKPoint<Double>.zero, MKSize<Double>.zero, MKPoint<Double>.zero),
              (MKPoint<Double>.zero, MKSize<Double>.identity, MKPoint<Double>.identity),
              (MKPoint<Double>.identity, MKSize<Double>.zero, MKPoint<Double>.identity),

              (MKPoint<Double>(x: 4, y: 5), MKSize<Double>.zero, MKPoint<Double>(x: 4, y: 5)),
              (MKPoint<Double>(x: 4, y: 5), MKSize<Double>(width: 10, height: 20), MKPoint<Double>(x: 14, y: 25)),
          ])
    func addSizeDouble(_ args: (MKPoint<Double>, MKSize<Double>, MKPoint<Double>)) throws {
        let (pt, add, expect) = args

        #expect((pt + add).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp += add
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKPointTests {
    @Test("Substraction <Double>",
          arguments: [
              (MKPoint<Double>.zero, MKPoint<Double>.zero, MKPoint<Double>.zero),
              (MKPoint<Double>.identity, MKPoint<Double>.zero, MKPoint<Double>.identity),
              (MKPoint<Double>.zero, MKPoint<Double>.identity, -MKPoint<Double>.identity),

              (MKPoint<Double>(x: 4, y: 5), MKPoint<Double>.zero, MKPoint<Double>(x: 4, y: 5)),
              (MKPoint<Double>(x: 4, y: 5), MKPoint<Double>(x: 10, y: 20), MKPoint<Double>(x: -6, y: -15)),
          ])
    func subDouble(_ args: (MKPoint<Double>, MKPoint<Double>, MKPoint<Double>)) throws {
        let (pt, sub, expect) = args

        #expect((pt - sub).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp -= sub
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Substraction Vector <Double>",
          arguments: [
              (MKPoint<Double>.zero, MKVector<Double>.zero, MKPoint<Double>.zero),
              (MKPoint<Double>.identity, MKVector<Double>.zero, MKPoint<Double>.identity),
              (MKPoint<Double>.zero, MKVector<Double>.identity, -MKPoint<Double>.identity),

              (MKPoint<Double>(x: 4, y: 5), MKVector<Double>.zero, MKPoint<Double>(x: 4, y: 5)),
              (MKPoint<Double>(x: 4, y: 5), MKVector<Double>(dx: 10, dy: 20), MKPoint<Double>(x: -6, y: -15)),
          ])
    func subVectorDouble(_ args: (MKPoint<Double>, MKVector<Double>, MKPoint<Double>)) throws {
        let (pt, sub, expect) = args

        #expect((pt - sub).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp -= sub
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Substraction Size <Double>",
          arguments: [
              (MKPoint<Double>.zero, MKSize<Double>.zero, MKPoint<Double>.zero),
              (MKPoint<Double>.identity, MKSize<Double>.zero, MKPoint<Double>.identity),
              (MKPoint<Double>.zero, MKSize<Double>.identity, -MKPoint<Double>.identity),

              (MKPoint<Double>(x: 4, y: 5), MKSize<Double>.zero, MKPoint<Double>(x: 4, y: 5)),
              (MKPoint<Double>(x: 4, y: 5), MKSize<Double>(width: 10, height: 20), MKPoint<Double>(x: -6, y: -15)),
          ])
    func subVectorDouble(_ args: (MKPoint<Double>, MKSize<Double>, MKPoint<Double>)) throws {
        let (pt, sub, expect) = args

        #expect((pt - sub).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp -= sub
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKPointTests {
    @Test("Multiply Scalar <Double>", arguments: [
        (MKPoint<Double>.zero, 0, MKPoint<Double>.zero),
        (MKPoint<Double>.identity, 0, MKPoint<Double>.zero),

        (MKPoint<Double>.zero, 1, MKPoint<Double>.zero),
        (MKPoint<Double>.identity, 1, MKPoint<Double>.identity),

        (MKPoint<Double>(x: 4, y: 8), 1, MKPoint<Double>(x: 4, y: 8)),
        (MKPoint<Double>(x: 4, y: 8), -1, MKPoint<Double>(x: -4, y: -8)),

        (MKPoint<Double>(x: 4, y: 8), 10, MKPoint<Double>(x: 40, y: 80)),
        (MKPoint<Double>(x: 4, y: 8), -10, MKPoint<Double>(x: -40, y: -80)),

    ])
    func mulScalarDouble(_ args: (MKPoint<Double>, Double, MKPoint<Double>)) throws {
        let (pt, scalar, expect) = args

        #expect((pt * scalar).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp *= scalar
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Multiply <Double>", arguments: [
        (MKPoint<Double>.zero, MKPoint<Double>.zero, MKPoint<Double>.zero),
        (MKPoint<Double>.identity, MKPoint<Double>.zero, MKPoint<Double>.zero),

        (MKPoint<Double>.zero, MKPoint<Double>.identity, MKPoint<Double>.zero),
        (MKPoint<Double>.identity, MKPoint<Double>.identity, MKPoint<Double>.identity),

        (MKPoint<Double>(x: 4, y: 8), MKPoint<Double>.identity, MKPoint<Double>(x: 4, y: 8)),
        (MKPoint<Double>(x: 4, y: 8), -MKPoint<Double>.identity, MKPoint<Double>(x: -4, y: -8)),

        (MKPoint<Double>(x: 4, y: 8), MKPoint<Double>(x: 10, y: 20), MKPoint<Double>(x: 40, y: 160)),
        (MKPoint<Double>(x: 4, y: 8), MKPoint<Double>(x: -10, y: -20), MKPoint<Double>(x: -40, y: -160)),

    ])
    func mulDouble(_ args: (MKPoint<Double>, MKPoint<Double>, MKPoint<Double>)) throws {
        let (pt, mul, expect) = args

        #expect((pt * mul).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp *= mul
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Add Product <Double>", arguments: [
        (MKPoint<Double>.zero, MKPoint<Double>.zero, MKPoint<Double>.zero, MKPoint<Double>.zero),
        (MKPoint<Double>.zero, MKPoint<Double>.identity, MKPoint<Double>.zero, MKPoint<Double>.zero),

        (MKPoint<Double>.identity, MKPoint<Double>.zero, MKPoint<Double>.zero, MKPoint<Double>.identity),

        (MKPoint<Double>(x: 2, y: 3), MKPoint<Double>(x: 3, y: 4), MKPoint<Double>(x: 10, y: 5), MKPoint<Double>(x: 32, y: 23)),

    ])
    func addProductDouble(_ args: (MKPoint<Double>, MKPoint<Double>, MKPoint<Double>, MKPoint<Double>)) {
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

extension MKPointTests {
    @Test("Divide Scalar <Double>", arguments: [
        (MKPoint<Double>.zero, 1, MKPoint<Double>.zero),
        (MKPoint<Double>.identity, 1, MKPoint<Double>.identity),

        (MKPoint<Double>(x: 4, y: 8), 1, MKPoint<Double>(x: 4, y: 8)),
        (MKPoint<Double>(x: 4, y: 8), -1, MKPoint<Double>(x: -4, y: -8)),

        (MKPoint<Double>(x: 4, y: 8), 10, MKPoint<Double>(x: 0.4, y: 0.8)),
        (MKPoint<Double>(x: 4, y: 8), -10, MKPoint<Double>(x: -0.4, y: -0.8)),

    ])
    func divScalarDouble(_ args: (MKPoint<Double>, Double, MKPoint<Double>)) throws {
        let (pt, scalar, expect) = args

        #expect((pt / scalar).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp /= scalar
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Divide <Double>", arguments: [
        (MKPoint<Double>.zero, MKPoint<Double>.identity, MKPoint<Double>.zero),
        (MKPoint<Double>.identity, MKPoint<Double>.identity, MKPoint<Double>.identity),

        (MKPoint<Double>(x: 4, y: 8), MKPoint<Double>.identity, MKPoint<Double>(x: 4, y: 8)),
        (MKPoint<Double>(x: 4, y: 8), -MKPoint<Double>.identity, MKPoint<Double>(x: -4, y: -8)),

        (MKPoint<Double>(x: 4, y: 8), MKPoint<Double>(x: 2, y: 4), MKPoint<Double>(x: 2, y: 2)),
        (MKPoint<Double>(x: 4, y: 8), MKPoint<Double>(x: -2, y: -4), MKPoint<Double>(x: -2, y: -2)),

    ])
    func divDouble(_ args: (MKPoint<Double>, MKPoint<Double>, MKPoint<Double>)) throws {
        let (pt, divider, expect) = args

        #expect((pt / divider).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp /= divider
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKPointTests {
    @Test("Magnitude <Double>", arguments: [
        (MKPoint<Double>.zero, 0),

        (MKPoint<Double>(x: 0, y: 1), 1),
        (MKPoint<Double>(x: 1, y: 0), 1),

        (MKPoint<Double>(x: 0, y: -1), 1),
        (MKPoint<Double>(x: -1, y: 0), 1),

        (MKPoint<Double>(x: 0, y: 5), 5),
        (MKPoint<Double>(x: 5, y: 0), 5),

        (MKPoint<Double>(x: 0, y: -5), 5),
        (MKPoint<Double>(x: -5, y: 0), 5),

        (MKPoint<Double>(x: 3, y: 4), 5),
        (MKPoint<Double>(x: -3, y: -4), 5),
        (MKPoint<Double>(x: 3, y: -4), 5),
        (MKPoint<Double>(x: -3, y: 4), 5),
    ])
    func magnitudeDouble(_ args: (MKPoint<Double>, Double)) {
        let (pt, expect) = args

        #expect(pt.magnitudeSquared.isEqual(to: expect * expect, tolerance: tolerance))
        #expect(pt.magnitude.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Distance <Double>", arguments: [
        (MKPoint<Double>.zero, MKPoint<Double>.zero, 0),
        (MKPoint<Double>.identity, MKPoint<Double>.identity, 0),
        (-MKPoint<Double>.identity, -MKPoint<Double>.identity, 0),
        (MKPoint<Double>(x: -3, y: 4), MKPoint<Double>(x: -3, y: 4), 0),

        (MKPoint<Double>.zero, MKPoint<Double>(x: -3, y: 4), 5),

        (MKPoint<Double>(x: 3, y: -4), MKPoint<Double>(x: -3, y: 4), 10),

    ])
    func distanceDouble(_ args: (MKPoint<Double>, MKPoint<Double>, Double)) {
        let (first, second, expect) = args

        #expect(first.distanceSquared(to: second).isEqual(to: expect * expect, tolerance: tolerance))
        #expect(first.distance(to: second).isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Normalize", arguments: [
        (MKPoint<Double>.identity, MKPoint<Double>(x: 0.7071067812, y: 0.7071067812)),
        (MKPoint<Double>(x: 0.7071067812, y: 0.7071067812), MKPoint<Double>(x: 0.7071067812, y: 0.7071067812)),

        (MKPoint<Double>(x: 30, y: 40), MKPoint<Double>(x: 0.6, y: 0.8)),
        (MKPoint<Double>(x: -30, y: 40), MKPoint<Double>(x: -0.6, y: 0.8)),
        (MKPoint<Double>(x: -30, y: -40), MKPoint<Double>(x: -0.6, y: -0.8)),
        (MKPoint<Double>(x: 30, y: -40), MKPoint<Double>(x: 0.6, y: -0.8)),
    ])
    func normalizeDouble(_ args: (MKPoint<Double>, MKPoint<Double>)) {
        let (point, expect) = args

        #expect(
            point.normalized().isEqual(to: expect, tolerance: tolerance)
        )

        var mpoint = point
        mpoint.normalize()

        #expect(
            mpoint.isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            mpoint.magnitudeSquared.isEqual(to: 1, tolerance: tolerance)
        )
    }

    @Test("Dot", arguments: [
        (Point(x: 0, y: 1), Point(x: 0, y: 1), 1.0),
        (Point(x: 0, y: -1), Point(x: 0, y: 1), -1.0),
        (Point(x: -6, y: 3), Point(x: 5, y: -2), -36.0),
        (Point(x: 10, y: 0), Point(x: 0, y: 10), 0.0),
        (Point(x: 0.8660254038, y: -0.5), Point(x: 0.5, y: 0.8660254038), 0.0),
    ])
    func _dot(_ args: (Point, Point, Double)) {
        let (first, second, expect) = args
        #expect(first.dot(second).isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Cross", arguments: [
        (Point(x: 10, y: 0), Point(x: 0, y: 10), 100.0),
        (Point(x: 0, y: 10), Point(x: 10, y: 0), -100.0),
        (Point(x: 10, y: 0), Point(x: 10, y: 10), 100.0),
        (Point(x: 0.8660254038, y: -0.5), Point(x: 0.5, y: 0.8660254038), 1.0),

    ])
    func _cross(_ args: (Point, Point, Double)) {
        let (first, second, expect) = args
        #expect(first.cross(second).isEqual(to: expect, tolerance: tolerance))
    }
}
