//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Transform Point <Double>", arguments: [
        (MKPoint<Double>.zero, MKAffineTransform<Double>.identity, MKPoint<Double>.zero),
        (MKPoint<Double>(x: 10, y: 20), MKAffineTransform<Double>(translationX: 2, y: 3), MKPoint<Double>(x: 12, y: 23)),
        (MKPoint<Double>(x: 20, y: 40), MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6), MKPoint<Double>(x: 145, y: 206)),
        (MKPoint<Double>(x: -10, y: 20), MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12), MKPoint<Double>(x: 121, y: 132)),
    ])
    func transformPointDouble(_ args: (MKPoint<Double>, MKAffineTransform<Double>, MKPoint<Double>)) {
        let (p, tr, expect) = args
        #expect(
            p.applying(tr).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            tr.transform(p).isEqual(to: expect, tolerance: tolerance)
        )

        #if canImport(CoreGraphics)
            let pt = CGPoint(p).applying(CGAffineTransform(tr))
            #expect(MKPoint<Double>(pt).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            let affine = AffineTransform(tr)
            let result = affine.transform(CGPoint(p))
            #expect(MKPoint<Double>(result).isEqual(to: expect, tolerance: tolerance))
        #endif
    }
}

extension MKAffineTransformTests {
    @Test("Transform Rect <Double>", arguments: [
        (MKRect<Double>.zero, MKAffineTransform<Double>.identity, MKRect<Double>.zero),
        (MKRect<Double>.identity, MKAffineTransform<Double>.identity, MKRect<Double>.identity),

        (
            MKRect<Double>.identity,
            MKAffineTransform<Double>(translationX: 2, y: 3),
            MKRect<Double>(origin: .init(x: 2, y: 3), size: .identity)
        ),

        (
            MKRect<Double>.identity,
            MKAffineTransform<Double>(scaleX: 2, y: 3),
            MKRect<Double>(origin: .zero, size: .init(width: 2, height: 3))
        ),

        (
            MKRect<Double>(x: -5, y: 10, width: 20, height: 30),
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12),
            MKRect<Double>(x: 66, y: 72, width: 410, height: 460)
        ),

    ])
    func transformRectDouble(_ args: (MKRect<Double>, MKAffineTransform<Double>, MKRect<Double>)) {
        let (r, tr, expect) = args
        #expect(
            r.applying(tr).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            tr.transform(r).isEqual(to: expect, tolerance: tolerance)
        )

        #if canImport(CoreGraphics)
            let rt = CGRect(r).applying(CGAffineTransform(tr))
            #expect(MKRect<Double>(rt).isEqual(to: expect, tolerance: tolerance))
        #endif
    }
}

extension MKAffineTransformTests {
    @Test("Transform Size <Double>", arguments: [
        (MKSize<Double>.zero, MKAffineTransform<Double>.identity, MKSize<Double>.zero),
        (MKSize<Double>.identity, MKAffineTransform<Double>.identity, MKSize<Double>.identity),

        (
            MKSize<Double>.identity,
            MKAffineTransform<Double>(translationX: 2, y: 3),
            MKSize<Double>.identity
        ),

        (
            MKSize<Double>.identity,
            MKAffineTransform<Double>(scaleX: 2, y: 3),
            MKSize<Double>(width: 2, height: 3)
        ),

        (
            MKSize<Double>(width: 20, height: 30),
            MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12),
            MKSize<Double>(width: 410, height: 460)
        ),

    ])
    func transformSizeDouble(_ args: (MKSize<Double>, MKAffineTransform<Double>, MKSize<Double>)) {
        let (s, tr, expect) = args
        #expect(
            s.applying(tr).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            tr.transform(s).isEqual(to: expect, tolerance: tolerance)
        )

        #if canImport(CoreGraphics)
            let st = CGSize(s).applying(CGAffineTransform(tr))
            #expect(MKSize<Double>(st).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            let affine = AffineTransform(tr)
            let result = affine.transform(CGSize(s))
            #expect(MKSize<Double>(result).isEqual(to: expect, tolerance: tolerance))
        #endif
    }
}
