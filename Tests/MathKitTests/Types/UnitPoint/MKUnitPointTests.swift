//
//  Created by Vitali Kurlovich on 06.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("MKUnitPoint")
struct MKUnitPointTests {}

extension MKUnitPointTests {
    @Test("Zero")
    func zero() {
        #expect(MKUnitPoint<Double>.zero.x == 0)
        #expect(MKUnitPoint<Double>.zero.y == 0)
    }

    @Test("Identity")
    func identity() throws {
        #expect(MKUnitPoint<Double>.identity.x == 1)
        #expect(MKUnitPoint<Double>.identity.y == 1)
    }
}

extension MKUnitPointTests {
    @Test("Negative",
          arguments: [
              (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero),
              (MKUnitPoint<Double>.identity, MKUnitPoint<Double>(x: -1, y: -1)),
              (MKUnitPoint<Double>(x: -2, y: -3), MKUnitPoint<Double>(x: 2, y: 3)),
          ])
    func negative(_ args: (MKUnitPoint<Double>, MKUnitPoint<Double>)) throws {
        let (pt, expect) = args
        #expect((-pt).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp.negate()
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKUnitPointTests {
    @Test("Addittion <Double>",
          arguments: [
              (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero),
              (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity, MKUnitPoint<Double>.identity),
              (MKUnitPoint<Double>.identity, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity),

              (MKUnitPoint<Double>(x: 4, y: 5), MKUnitPoint<Double>.zero, MKUnitPoint<Double>(x: 4, y: 5)),
              (MKUnitPoint<Double>(x: 4, y: 5), MKUnitPoint<Double>(x: 10, y: 20), MKUnitPoint<Double>(x: 14, y: 25)),
          ])
    func addDouble(_ args: (MKUnitPoint<Double>, MKUnitPoint<Double>, MKUnitPoint<Double>)) throws {
        let (pt, add, expect) = args

        #expect((pt + add).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp += add
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKUnitPointTests {
    @Test("Substraction <Double>",
          arguments: [
              (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero),
              (MKUnitPoint<Double>.identity, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity),
              (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity, -MKUnitPoint<Double>.identity),

              (MKUnitPoint<Double>(x: 4, y: 5), MKUnitPoint<Double>.zero, MKUnitPoint<Double>(x: 4, y: 5)),
              (MKUnitPoint<Double>(x: 4, y: 5), MKUnitPoint<Double>(x: 10, y: 20), MKUnitPoint<Double>(x: -6, y: -15)),
          ])
    func subDouble(_ args: (MKUnitPoint<Double>, MKUnitPoint<Double>, MKUnitPoint<Double>)) throws {
        let (pt, sub, expect) = args

        #expect((pt - sub).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp -= sub
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKUnitPointTests {
    @Test("Multiply Scalar <Double>", arguments: [
        (MKUnitPoint<Double>.zero, 0, MKUnitPoint<Double>.zero),
        (MKUnitPoint<Double>.identity, 0, MKUnitPoint<Double>.zero),

        (MKUnitPoint<Double>.zero, 1, MKUnitPoint<Double>.zero),
        (MKUnitPoint<Double>.identity, 1, MKUnitPoint<Double>.identity),

        (MKUnitPoint<Double>(x: 4, y: 8), 1, MKUnitPoint<Double>(x: 4, y: 8)),
        (MKUnitPoint<Double>(x: 4, y: 8), -1, MKUnitPoint<Double>(x: -4, y: -8)),

        (MKUnitPoint<Double>(x: 4, y: 8), 10, MKUnitPoint<Double>(x: 40, y: 80)),
        (MKUnitPoint<Double>(x: 4, y: 8), -10, MKUnitPoint<Double>(x: -40, y: -80)),
    ])
    func mulScalarDouble(_ args: (MKUnitPoint<Double>, Double, MKUnitPoint<Double>)) throws {
        let (pt, scalar, expect) = args

        #expect((pt * scalar).isEqual(to: expect, tolerance: tolerance))
        #expect((scalar * pt).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp *= scalar
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Multiply <Double>", arguments: [
        (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero),
        (MKUnitPoint<Double>.identity, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero),

        (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity, MKUnitPoint<Double>.zero),
        (MKUnitPoint<Double>.identity, MKUnitPoint<Double>.identity, MKUnitPoint<Double>.identity),

        (MKUnitPoint<Double>(x: 4, y: 8), MKUnitPoint<Double>.identity, MKUnitPoint<Double>(x: 4, y: 8)),
        (MKUnitPoint<Double>(x: 4, y: 8), -MKUnitPoint<Double>.identity, MKUnitPoint<Double>(x: -4, y: -8)),

        (MKUnitPoint<Double>(x: 4, y: 8), MKUnitPoint<Double>(x: 10, y: 20), MKUnitPoint<Double>(x: 40, y: 160)),
        (MKUnitPoint<Double>(x: 4, y: 8), MKUnitPoint<Double>(x: -10, y: -20), MKUnitPoint<Double>(x: -40, y: -160)),

    ])
    func mulDouble(_ args: (MKUnitPoint<Double>, MKUnitPoint<Double>, MKUnitPoint<Double>)) throws {
        let (pt, mul, expect) = args

        #expect((pt * mul).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp *= mul
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Add Product <Double>", arguments: [
        (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero),
        (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero),

        (MKUnitPoint<Double>.identity, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity),

        (MKUnitPoint<Double>(x: 2, y: 3), MKUnitPoint<Double>(x: 3, y: 4), MKUnitPoint<Double>(x: 10, y: 5), MKUnitPoint<Double>(x: 32, y: 23)),
    ])
    func addProductDouble(_ args: (MKUnitPoint<Double>, MKUnitPoint<Double>, MKUnitPoint<Double>, MKUnitPoint<Double>)) {
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

extension MKUnitPointTests {
    @Test("Divide Scalar <Double>", arguments: [
        (MKUnitPoint<Double>.zero, 1, MKUnitPoint<Double>.zero),
        (MKUnitPoint<Double>.identity, 1, MKUnitPoint<Double>.identity),

        (MKUnitPoint<Double>(x: 4, y: 8), 1, MKUnitPoint<Double>(x: 4, y: 8)),
        (MKUnitPoint<Double>(x: 4, y: 8), -1, MKUnitPoint<Double>(x: -4, y: -8)),

        (MKUnitPoint<Double>(x: 4, y: 8), 10, MKUnitPoint<Double>(x: 0.4, y: 0.8)),
        (MKUnitPoint<Double>(x: 4, y: 8), -10, MKUnitPoint<Double>(x: -0.4, y: -0.8)),
    ])
    func divScalarDouble(_ args: (MKUnitPoint<Double>, Double, MKUnitPoint<Double>)) throws {
        let (pt, scalar, expect) = args

        #expect((pt / scalar).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp /= scalar
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Divide <Double>", arguments: [
        (MKUnitPoint<Double>.zero, MKUnitPoint<Double>.identity, MKUnitPoint<Double>.zero),
        (MKUnitPoint<Double>.identity, MKUnitPoint<Double>.identity, MKUnitPoint<Double>.identity),

        (MKUnitPoint<Double>(x: 4, y: 8), MKUnitPoint<Double>.identity, MKUnitPoint<Double>(x: 4, y: 8)),
        (MKUnitPoint<Double>(x: 4, y: 8), -MKUnitPoint<Double>.identity, MKUnitPoint<Double>(x: -4, y: -8)),

        (MKUnitPoint<Double>(x: 4, y: 8), MKUnitPoint<Double>(x: 2, y: 4), MKUnitPoint<Double>(x: 2, y: 2)),
        (MKUnitPoint<Double>(x: 4, y: 8), MKUnitPoint<Double>(x: -2, y: -4), MKUnitPoint<Double>(x: -2, y: -2)),
    ])
    func divDouble(_ args: (MKUnitPoint<Double>, MKUnitPoint<Double>, MKUnitPoint<Double>)) throws {
        let (pt, divider, expect) = args

        #expect((pt / divider).isEqual(to: expect, tolerance: tolerance))
        var mp = pt
        mp /= divider
        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKUnitPointTests {
    @Test("MKPoint <Double>",
          arguments: [
              (MKUnitPoint<Double>.zero, MKPoint<Double>.zero, MKPoint<Double>.zero),
              (MKUnitPoint<Double>.zero, MKPoint<Double>.identity, MKPoint<Double>.zero),

              (MKUnitPoint<Double>.identity, MKPoint<Double>.zero, MKPoint<Double>.zero),
              (MKUnitPoint<Double>.identity, MKPoint<Double>.identity, MKPoint<Double>.identity),

              (MKUnitPoint<Double>(x: 0.2, y: 0.4), MKPoint<Double>(x: 10, y: 20), MKPoint<Double>(x: 2, y: 8)),

          ])
    func vectorDouble(_ args: (MKUnitPoint<Double>, MKPoint<Double>, MKPoint<Double>)) throws {
        let (unit, pt, expect) = args

        #expect((pt * unit).isEqual(to: expect, tolerance: tolerance))

        var mp = pt
        mp *= unit

        #expect(mp.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKUnitPointTests {
    @Test("MKVector <Double>",
          arguments: [
              (MKUnitPoint<Double>.zero, MKVector<Double>.zero, MKVector<Double>.zero),
              (MKUnitPoint<Double>.zero, MKVector<Double>.identity, MKVector<Double>.zero),

              (MKUnitPoint<Double>.identity, MKVector<Double>.zero, MKVector<Double>.zero),
              (MKUnitPoint<Double>.identity, MKVector<Double>.identity, MKVector<Double>.identity),

              (MKUnitPoint<Double>(x: 0.2, y: 0.4), MKVector<Double>(dx: 10, dy: 20), MKVector<Double>(dx: 2, dy: 8)),
          ])
    func vectorDouble(_ args: (MKUnitPoint<Double>, MKVector<Double>, MKVector<Double>)) throws {
        let (unit, vec, expect) = args

        #expect((vec * unit).isEqual(to: expect, tolerance: tolerance))

        var mvec = vec
        mvec *= unit

        #expect(mvec.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKUnitPointTests {
    @Test("MKSize <Double>",
          arguments: [
              (MKUnitPoint<Double>.zero, MKSize<Double>.zero, MKSize<Double>.zero),
              (MKUnitPoint<Double>.zero, MKSize<Double>.identity, MKSize<Double>.zero),

              (MKUnitPoint<Double>.identity, MKSize<Double>.zero, MKSize<Double>.zero),
              (MKUnitPoint<Double>.identity, MKSize<Double>.identity, MKSize<Double>.identity),

              (MKUnitPoint<Double>(x: 0.2, y: 0.4), MKSize<Double>(width: 10, height: 20), MKSize<Double>(width: 2, height: 8)),
          ])
    func sizeDouble(_ args: (MKUnitPoint<Double>, MKSize<Double>, MKSize<Double>)) throws {
        let (unit, size, expect) = args

        #expect((size * unit).isEqual(to: expect, tolerance: tolerance))

        var msize = size
        msize *= unit

        #expect(msize.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("MKSize Project <Double>",
          arguments: [
              (MKUnitPoint<Double>.zero, MKSize<Double>.zero, MKVector<Double>.zero),
              (MKUnitPoint<Double>.zero, MKSize<Double>.identity, MKVector<Double>.zero),

              (MKUnitPoint<Double>.identity, MKSize<Double>.zero, MKVector<Double>.zero),
              (MKUnitPoint<Double>.identity, MKSize<Double>.identity, MKVector<Double>.identity),

              (MKUnitPoint<Double>(x: 0.2, y: 0.4), MKSize<Double>(width: 10, height: 20), MKVector<Double>(dx: 2, dy: 8)),
          ])
    func sizeProjectDouble(_ args: (MKUnitPoint<Double>, MKSize<Double>, MKVector<Double>)) throws {
        let (unit, size, expect) = args
        #expect(size.projected(unit).isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKUnitPointTests {
    @Test("MKRect <Double>",
          arguments: [
              (MKUnitPoint<Double>.zero, MKRect<Double>.zero, MKPoint<Double>.zero),
              (MKUnitPoint<Double>.zero, MKRect<Double>.identity, MKPoint<Double>.zero),

              (MKUnitPoint<Double>.identity, MKRect<Double>.zero, MKPoint<Double>.zero),
              (MKUnitPoint<Double>.identity, MKRect<Double>.identity, MKPoint<Double>.identity),

              (MKUnitPoint<Double>.center, MKRect<Double>(width: 10, height: 20), MKPoint<Double>(x: 5, y: 10)),
              (MKUnitPoint<Double>.center, MKRect<Double>(x: 100, y: 200, width: 10, height: 20), MKPoint<Double>(x: 105, y: 210)),

              (MKUnitPoint<Double>(x: 0.2, y: 0.4), MKRect<Double>(width: 10, height: 20), MKPoint<Double>(x: 2, y: 8)),
              (MKUnitPoint<Double>(x: 0.2, y: 0.4), MKRect<Double>(x: 100, y: 200, width: 10, height: 20), MKPoint<Double>(x: 102, y: 208)),

          ])
    func rectProjectedDouble(_ args: (MKUnitPoint<Double>, MKRect<Double>, MKPoint<Double>)) throws {
        let (unit, rect, expect) = args
        #expect(rect.projected(unit).isEqual(to: expect, tolerance: tolerance))
    }
}
