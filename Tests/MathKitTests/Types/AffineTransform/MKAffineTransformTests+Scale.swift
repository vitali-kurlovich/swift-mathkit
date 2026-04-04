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
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.01

extension MKAffineTransformTests {
    @Test("Constructor Scale <Double>", arguments: [
        (Double(1.0), MKAffineTransform<Double>.identity),
        (Double(4.0), MKAffineTransform<Double>(m11: 4.0, m12: 0.0, m21: 0.0, m22: 4.0, tx: 0.0, ty: 0.0)),
    ])
    func initScale(_ args: (Double, MKAffineTransform<Double>)) {
        let (scaleFactor, expect) = args
        #expect(MKAffineTransform<Double>(scale: scaleFactor).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>(scale: scaleFactor).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>.scale(scaleFactor).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>.scale(x: scaleFactor, y: scaleFactor).isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
            #expect(MKAffineTransform<Double>(cg).isEqual(to: expect, tolerance: tolerance))

        #endif

        #if os(macOS) || os(Linux)
            let affine = AffineTransform(scale: scaleFactor)
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("Constructor ScaleXY <Double>", arguments: [
        (Double(2.0), Double(3.0), MKAffineTransform<Double>(m11: 2.0, m12: 0.0, m21: 0.0, m22: 3.0, tx: 0.0, ty: 0.0)),

    ])
    func initScaleXY(_ args: (Double, Double, MKAffineTransform<Double>)) {
        let (scaleX, scaleY, expect) = args
        let size = MKSize(width: scaleX, height: scaleY)

        #expect(MKAffineTransform<Double>(scaleX: scaleX, y: scaleY).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>(scaleByX: scaleX, byY: scaleY).isEqual(to: expect, tolerance: tolerance))

        #expect(MKAffineTransform<Double>(size).isEqual(to: expect, tolerance: tolerance))

        #expect(MKAffineTransform<Double>.scale(x: scaleX, y: scaleY).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>.scale(size).isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(scaleX: scaleX, y: scaleY)
            #expect(MKAffineTransform<Double>(cg).isEqual(to: expect, tolerance: tolerance))

        #endif

        #if os(macOS) || os(Linux)
            let affine = AffineTransform(scaleByX: scaleX, byY: scaleY)
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }
}

extension MKAffineTransformTests {
    @Test("Scale <Double>", arguments: [
        (Double(1.0), MKAffineTransform<Double>.identity),
        (Double(4.0), MKAffineTransform<Double>(m11: 4.0, m12: 0.0, m21: 0.0, m22: 4.0, tx: 0.0, ty: 0.0)),
    ])
    func scale(_ args: (Double, MKAffineTransform<Double>)) {
        let (scaleFactor, expect) = args

        #expect(
            MKAffineTransform<Double>.identity.scaled(scaleFactor).isEqual(to: expect, tolerance: tolerance)
        )

        var tr = MKAffineTransform<Double>.identity
        tr.scale(scaleFactor)

        #expect(
            tr.isEqual(to: expect, tolerance: tolerance)
        )

        #if os(macOS) || os(Linux)
            var affine = AffineTransform()
            affine.scale(scaleFactor)
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("ScaleXY <Double>", arguments: [
        (Double(2.0), Double(3.0), MKAffineTransform<Double>(m11: 2.0, m12: 0.0, m21: 0.0, m22: 3.0, tx: 0.0, ty: 0.0)),
    ])
    func scaleXY(_ args: (Double, Double, MKAffineTransform<Double>)) {
        let (scaleX, scaleY, expect) = args
        let size = MKSize(width: scaleX, height: scaleY)

        #expect(
            MKAffineTransform<Double>.identity.scaled(x: scaleX, y: scaleY).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            MKAffineTransform<Double>.identity.scaledBy(x: scaleX, y: scaleY).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            MKAffineTransform<Double>.identity.scaled(size).isEqual(to: expect, tolerance: tolerance)
        )

        var tr = MKAffineTransform<Double>.identity
        tr.scale(x: scaleX, y: scaleY)

        #expect(
            tr.isEqual(to: expect, tolerance: tolerance)
        )

        tr = MKAffineTransform<Double>.identity
        tr.scale(size)

        #expect(
            tr.isEqual(to: expect, tolerance: tolerance)
        )

        #if canImport(CoreGraphics)
            var cg = CGAffineTransform.identity
            cg = cg.scaledBy(x: scaleX, y: scaleY)
            #expect(MKAffineTransform<Double>(cg).isEqual(to: expect, tolerance: tolerance))

        #endif

        #if os(macOS) || os(Linux)
            var affine = AffineTransform()
            affine.scale(x: scaleX, y: scaleY)
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }
}
