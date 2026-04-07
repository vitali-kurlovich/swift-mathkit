//
//  Created by Vitali Kurlovich on 07.04.2026.
//

import Foundation
import MathKit
import Testing

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

private let tolerance: Double = 0.000000000001
private let halfTolerance: Float32 = 0.00001
private let lowTolerance: Float16 = 0.1

extension MKAffineTransformComponentsTests {
    @Test("Transform Point <Double>", arguments: [
        (MKPoint<Double>.zero, MKAffineTransformComponents<Double>.zero, MKPoint<Double>.zero),

        (MKPoint<Double>(x: 10, y: 20),
         MKAffineTransformComponents<Double>(translation: .init(dx: 2, dy: 3)),
         MKPoint<Double>(x: 12, y: 23)),

        (MKPoint<Double>(x: -10, y: -20),
         MKAffineTransformComponents<Double>(translation: .init(dx: 12, dy: 32)),
         MKPoint<Double>(x: 2, y: 12)),

        (MKPoint<Double>(x: 10, y: 20),
         MKAffineTransformComponents<Double>(scale: .init(width: 4, height: 5)),
         MKPoint<Double>(x: 40, y: 100)),

        (MKPoint<Double>(x: -10, y: -20),
         MKAffineTransformComponents<Double>(scale: .init(width: 4, height: 5)),
         MKPoint<Double>(x: -40, y: -100)),

        (MKPoint<Double>(x: 10, y: 20),
         MKAffineTransformComponents<Double>(rotation: .radians(.pi / 3)),
         MKPoint<Double>(x: -12.32050807568877, y: 18.66025403784439)),

        (MKPoint<Double>(x: -10, y: -20),
         MKAffineTransformComponents<Double>(rotation: .radians(.pi / 3)),
         MKPoint<Double>(x: 12.32050807568877, y: -18.66025403784439)),

        (MKPoint<Double>(x: 10, y: 20),
         MKAffineTransformComponents<Double>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<Double>(x: -78.60254037844385, y: 92.64101615137756)),

        (MKPoint<Double>(x: -10, y: -20),
         MKAffineTransformComponents<Double>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<Double>(x: 54.60254037844385, y: -76.64101615137756)),

    ])
    func transformPointDouble(_ args: (MKPoint<Double>, MKAffineTransformComponents<Double>, MKPoint<Double>)) {
        let (p, comp, expect) = args
        #expect(
            p.applying(comp).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            p.applying(comp.affine).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            comp.transform(p).isEqual(to: expect, tolerance: tolerance)
        )

        let tr = MKAffineTransform(comp)
        #expect(
            p.applying(tr).isEqual(to: expect, tolerance: tolerance)
        )

        // - Inverse
        #expect(
            expect.applyingInverse(comp).isEqual(to: p, tolerance: tolerance)
        )

        #expect(
            expect.applying(comp.inverseAffine).isEqual(to: p, tolerance: tolerance)
        )

        #expect(
            comp.affine.inverse(expect).isEqual(to: p, tolerance: tolerance)
        )
        #expect(
            comp.inverse(expect).isEqual(to: p, tolerance: tolerance)
        )
    }
}

extension MKAffineTransformComponentsTests {
    @Test("Transform Point <CGFloat>", arguments: [
        (MKPoint<CGFloat>.zero, MKAffineTransformComponents<CGFloat>.zero, MKPoint<CGFloat>.zero),

        (MKPoint<CGFloat>(x: 10, y: 20),
         MKAffineTransformComponents<CGFloat>(translation: .init(dx: 2, dy: 3)),
         MKPoint<CGFloat>(x: 12, y: 23)),

        (MKPoint<CGFloat>(x: -10, y: -20),
         MKAffineTransformComponents<CGFloat>(translation: .init(dx: 12, dy: 32)),
         MKPoint<CGFloat>(x: 2, y: 12)),

        (MKPoint<CGFloat>(x: 10, y: 20),
         MKAffineTransformComponents<CGFloat>(scale: .init(width: 4, height: 5)),
         MKPoint<CGFloat>(x: 40, y: 100)),

        (MKPoint<CGFloat>(x: -10, y: -20),
         MKAffineTransformComponents<CGFloat>(scale: .init(width: 4, height: 5)),
         MKPoint<CGFloat>(x: -40, y: -100)),

        (MKPoint<CGFloat>(x: 10, y: 20),
         MKAffineTransformComponents<CGFloat>(rotation: .radians(.pi / 3)),
         MKPoint<CGFloat>(x: -12.32050807568877, y: 18.66025403784439)),

        (MKPoint<CGFloat>(x: -10, y: -20),
         MKAffineTransformComponents<CGFloat>(rotation: .radians(.pi / 3)),
         MKPoint<CGFloat>(x: 12.32050807568877, y: -18.66025403784439)),

        (MKPoint<CGFloat>(x: 10, y: 20),
         MKAffineTransformComponents<CGFloat>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<CGFloat>(x: -78.60254037844385, y: 92.64101615137756)),

        (MKPoint<CGFloat>(x: -10, y: -20),
         MKAffineTransformComponents<CGFloat>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<CGFloat>(x: 54.60254037844385, y: -76.64101615137756)),

    ])
    func transformPointCGFloat(_ args: (MKPoint<CGFloat>, MKAffineTransformComponents<CGFloat>, MKPoint<CGFloat>)) {
        let (p, comp, expect) = args
        #expect(
            p.applying(comp).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            p.applying(comp.affine).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            comp.transform(p).isEqual(to: expect, tolerance: tolerance)
        )

        let tr = MKAffineTransform(comp)
        #expect(
            p.applying(tr).isEqual(to: expect, tolerance: tolerance)
        )

        // - Inverse
        #expect(
            expect.applyingInverse(comp).isEqual(to: p, tolerance: tolerance)
        )

        #expect(
            expect.applying(comp.inverseAffine).isEqual(to: p, tolerance: tolerance)
        )

        #expect(
            comp.affine.inverse(expect).isEqual(to: p, tolerance: tolerance)
        )
        #expect(
            comp.inverse(expect).isEqual(to: p, tolerance: tolerance)
        )
    }
}

extension MKAffineTransformComponentsTests {
    @Test("Transform Point <Float>", arguments: [
        (MKPoint<Float>.zero, MKAffineTransformComponents<Float>.zero, MKPoint<Float>.zero),

        (MKPoint<Float>(x: 10, y: 20),
         MKAffineTransformComponents<Float>(translation: .init(dx: 2, dy: 3)),
         MKPoint<Float>(x: 12, y: 23)),

        (MKPoint<Float>(x: -10, y: -20),
         MKAffineTransformComponents<Float>(translation: .init(dx: 12, dy: 32)),
         MKPoint<Float>(x: 2, y: 12)),

        (MKPoint<Float>(x: 10, y: 20),
         MKAffineTransformComponents<Float>(scale: .init(width: 4, height: 5)),
         MKPoint<Float>(x: 40, y: 100)),

        (MKPoint<Float>(x: -10, y: -20),
         MKAffineTransformComponents<Float>(scale: .init(width: 4, height: 5)),
         MKPoint<Float>(x: -40, y: -100)),

        (MKPoint<Float>(x: 10, y: 20),
         MKAffineTransformComponents<Float>(rotation: .radians(.pi / 3)),
         MKPoint<Float>(x: -12.32050807568877, y: 18.66025403784439)),

        (MKPoint<Float>(x: -10, y: -20),
         MKAffineTransformComponents<Float>(rotation: .radians(.pi / 3)),
         MKPoint<Float>(x: 12.32050807568877, y: -18.66025403784439)),

        (MKPoint<Float>(x: 10, y: 20),
         MKAffineTransformComponents<Float>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<Float>(x: -78.60254037844385, y: 92.64101615137756)),

        (MKPoint<Float>(x: -10, y: -20),
         MKAffineTransformComponents<Float>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<Float>(x: 54.60254037844385, y: -76.64101615137756)),

    ])
    func transformPointFloat(_ args: (MKPoint<Float>, MKAffineTransformComponents<Float>, MKPoint<Float>)) {
        let (p, comp, expect) = args
        #expect(
            p.applying(comp).isEqual(to: expect, tolerance: halfTolerance)
        )

        #expect(
            p.applying(comp.affine).isEqual(to: expect, tolerance: halfTolerance)
        )

        #expect(
            comp.transform(p).isEqual(to: expect, tolerance: halfTolerance)
        )

        let tr = MKAffineTransform(comp)
        #expect(
            p.applying(tr).isEqual(to: expect, tolerance: halfTolerance)
        )

        // - Inverse
        #expect(
            expect.applyingInverse(comp).isEqual(to: p, tolerance: halfTolerance)
        )

        #expect(
            expect.applying(comp.inverseAffine).isEqual(to: p, tolerance: halfTolerance)
        )

        #expect(
            comp.affine.inverse(expect).isEqual(to: p, tolerance: halfTolerance)
        )
        #expect(
            comp.inverse(expect).isEqual(to: p, tolerance: halfTolerance)
        )
    }
}

extension MKAffineTransformComponentsTests {
    @Test("Transform Point <Float16>", arguments: [
        (MKPoint<Float16>.zero, MKAffineTransformComponents<Float16>.zero, MKPoint<Float16>.zero),

        (MKPoint<Float16>(x: 10, y: 20),
         MKAffineTransformComponents<Float16>(translation: .init(dx: 2, dy: 3)),
         MKPoint<Float16>(x: 12, y: 23)),

        (MKPoint<Float16>(x: -10, y: -20),
         MKAffineTransformComponents<Float16>(translation: .init(dx: 12, dy: 32)),
         MKPoint<Float16>(x: 2, y: 12)),

        (MKPoint<Float16>(x: 10, y: 20),
         MKAffineTransformComponents<Float16>(scale: .init(width: 4, height: 5)),
         MKPoint<Float16>(x: 40, y: 100)),

        (MKPoint<Float16>(x: -10, y: -20),
         MKAffineTransformComponents<Float16>(scale: .init(width: 4, height: 5)),
         MKPoint<Float16>(x: -40, y: -100)),

        (MKPoint<Float16>(x: 10, y: 20),
         MKAffineTransformComponents<Float16>(rotation: .radians(.pi / 3)),
         MKPoint<Float16>(x: -12.32050807568877, y: 18.66025403784439)),

        (MKPoint<Float16>(x: -10, y: -20),
         MKAffineTransformComponents<Float16>(rotation: .radians(.pi / 3)),
         MKPoint<Float16>(x: 12.32050807568877, y: -18.66025403784439)),

        (MKPoint<Float16>(x: 10, y: 20),
         MKAffineTransformComponents<Float16>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<Float16>(x: -78.60254037844385, y: 92.64101615137756)),

        (MKPoint<Float16>(x: -10, y: -20),
         MKAffineTransformComponents<Float16>(translation: .init(dx: -12, dy: 8), rotation: .radians(.pi / 3), scale: .init(width: 4, height: 5)),
         MKPoint<Float16>(x: 54.60254037844385, y: -76.64101615137756)),

    ])
    func transformPointFloat16(_ args: (MKPoint<Float16>, MKAffineTransformComponents<Float16>, MKPoint<Float16>)) {
        let (p, comp, expect) = args
        #expect(
            p.applying(comp).isEqual(to: expect, tolerance: lowTolerance)
        )

        #expect(
            p.applying(comp.affine).isEqual(to: expect, tolerance: lowTolerance)
        )

        #expect(
            comp.transform(p).isEqual(to: expect, tolerance: lowTolerance)
        )

        let tr = MKAffineTransform(comp)
        #expect(
            p.applying(tr).isEqual(to: expect, tolerance: lowTolerance)
        )

        // - Inverse
        #expect(
            expect.applyingInverse(comp).isEqual(to: p, tolerance: lowTolerance)
        )

        #expect(
            expect.applying(comp.inverseAffine).isEqual(to: p, tolerance: lowTolerance)
        )

        #expect(
            comp.affine.inverse(expect).isEqual(to: p, tolerance: lowTolerance)
        )
        #expect(
            comp.inverse(expect).isEqual(to: p, tolerance: lowTolerance)
        )
    }
}
