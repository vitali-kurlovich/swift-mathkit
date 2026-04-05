//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Append", arguments: [
        (MKAffineTransform<Double>.identity, MKAffineTransform<Double>.identity, MKAffineTransform<Double>.identity),

        (
            MKAffineTransform<Double>.identity,
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12),
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)
        ),

        (
            MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
            MKAffineTransform<Double>.identity,
            MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        ),

        (
            MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12),
            MKAffineTransform<Double>(m11: 25.0, m12: 28.0, m21: 57.0, m22: 64.0, tx: 100.0, ty: 112.0)
        ),
    ])
    func append(_ args: (MKAffineTransform<Double>, MKAffineTransform<Double>, MKAffineTransform<Double>)) {
        let (first, second, expect) = args

        let appended = first.appended(second)
        #expect(appended.isEqual(to: expect, tolerance: tolerance))

        let concatenating = first.concatenating(second)
        #expect(concatenating.isEqual(to: expect, tolerance: tolerance))

        var src = first
        src.append(second)
        #expect(src.isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cgFirst = CGAffineTransform(first)
            let cgSecond = CGAffineTransform(second)

            let cgConcat = cgFirst.concatenating(cgSecond)

            #expect(MKAffineTransform<Double>(cgConcat).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            var firstAffine = AffineTransform(first)
            let secondAffine = AffineTransform(second)

            firstAffine.append(secondAffine)

            #expect(MKAffineTransform<Double>(firstAffine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("Prepend", arguments: [
        (MKAffineTransform<Double>.identity, MKAffineTransform<Double>.identity, MKAffineTransform<Double>.identity),
        (
            MKAffineTransform<Double>.identity,
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12),
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)
        ),

        (
            MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
            MKAffineTransform<Double>.identity,
            MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        ),
        (
            MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12),
            MKAffineTransform<Double>(m11: 31.0, m12: 46.0, m21: 39.0, m22: 58.0, tx: 52.0, ty: 76.0)
        )
    ])
    func prepend(_ args: (MKAffineTransform<Double>, MKAffineTransform<Double>, MKAffineTransform<Double>)) {
        let (first, second, expect) = args

        let prepended = first.prepended(second)
        #expect(prepended.isEqual(to: expect, tolerance: tolerance))

        var src = first
        src.prepend(second)
        #expect(src.isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cgFirst = CGAffineTransform(first)
            let cgSecond = CGAffineTransform(second)

            let cgConcat = cgSecond.concatenating(cgFirst)

            #expect(MKAffineTransform<Double>(cgConcat).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            var firstAffine = AffineTransform(first)
            let secondAffine = AffineTransform(second)

            firstAffine.prepend(secondAffine)

            #expect(MKAffineTransform<Double>(firstAffine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }
}
