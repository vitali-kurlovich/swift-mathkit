//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

private let tolerance: Double = 0.000001
private let halfTolerance: Float32 = 0.001
private let lowTolerance: Float16 = 0.01

extension MKAffineTransformTests {
    @Test("Constructor Rotation <Double>",
          arguments: [
              (MKAngle<Double>.zero, MKAffineTransform<Double>.identity),
              (MKAngle<Double>(radians: .pi / 2), MKAffineTransform<Double>(m11: 0, m12: 1.0, m21: -1.0, m22: 0, tx: 0.0, ty: 0.0)),
              (MKAngle<Double>(radians: .pi), MKAffineTransform<Double>(m11: -1.0, m12: 0, m21: 0, m22: -1.0, tx: 0.0, ty: 0.0)),
              (MKAngle<Double>(radians: .pi / 8), MKAffineTransform<Double>(m11: 0.9238795325112866, m12: 0.3826834323650898,
                                                                            m21: -0.3826834323650898, m22: 0.9238795325112866,
                                                                            tx: 0.0, ty: 0.0)),

              (MKAngle<Double>(degrees: 66), MKAffineTransform<Double>(m11: 0.4067366430758002, m12: 0.9135454576426009,
                                                                       m21: -0.9135454576426009, m22: 0.4067366430758002,
                                                                       tx: 0.0, ty: 0.0)),

          ])
    func initRotate(_ args: (MKAngle<Double>, MKAffineTransform<Double>)) {
        let (angle, expect) = args
        #expect(MKAffineTransform<Double>(angle).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>.rotation(angle).isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(rotationAngle: .init(angle.radians))
            #expect(MKAffineTransform<Double>(cg).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            let affine = AffineTransform(rotationByRadians: .init(angle.radians))
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("Constructor Rotation <CGFloat>",
          arguments: [
              (MKAngle<CGFloat>.zero, MKAffineTransform<CGFloat>.identity),
              (MKAngle<CGFloat>(radians: .pi / 2), MKAffineTransform<CGFloat>(m11: 0, m12: 1.0, m21: -1.0, m22: 0, tx: 0.0, ty: 0.0)),
              (MKAngle<CGFloat>(radians: .pi), MKAffineTransform<CGFloat>(m11: -1.0, m12: 0, m21: 0, m22: -1.0, tx: 0.0, ty: 0.0)),
              (MKAngle<CGFloat>(radians: .pi / 8), MKAffineTransform<CGFloat>(m11: 0.9238795325112866, m12: 0.3826834323650898,
                                                                              m21: -0.3826834323650898, m22: 0.9238795325112866,
                                                                              tx: 0.0, ty: 0.0)),

              (MKAngle<CGFloat>(degrees: 66), MKAffineTransform<CGFloat>(m11: 0.4067366430758002, m12: 0.9135454576426009,
                                                                         m21: -0.9135454576426009, m22: 0.4067366430758002,
                                                                         tx: 0.0, ty: 0.0)),

          ])
    func initRotate(_ args: (MKAngle<CGFloat>, MKAffineTransform<CGFloat>)) {
        let (angle, expect) = args
        #expect(MKAffineTransform<CGFloat>(angle).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<CGFloat>.rotation(angle).isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(rotationAngle: .init(angle.radians))
            #expect(MKAffineTransform<CGFloat>(cg).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            let affine = AffineTransform(rotationByRadians: .init(angle.radians))
            #expect(MKAffineTransform<CGFloat>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("Constructor Rotation <Float>",
          arguments: [
              (MKAngle<Float>.zero, MKAffineTransform<Float>.identity),
              (MKAngle<Float>(radians: .pi / 2), MKAffineTransform<Float>(m11: 0, m12: 1.0, m21: -1.0, m22: 0, tx: 0.0, ty: 0.0)),
              (MKAngle<Float>(radians: .pi), MKAffineTransform<Float>(m11: -1.0, m12: 0, m21: 0, m22: -1.0, tx: 0.0, ty: 0.0)),
              (MKAngle<Float>(radians: .pi / 8), MKAffineTransform<Float>(m11: 0.9238795325112866, m12: 0.3826834323650898,
                                                                          m21: -0.3826834323650898, m22: 0.9238795325112866,
                                                                          tx: 0.0, ty: 0.0)),

              (MKAngle<Float>(degrees: 66), MKAffineTransform<Float>(m11: 0.4067366430758002, m12: 0.9135454576426009,
                                                                     m21: -0.9135454576426009, m22: 0.4067366430758002,
                                                                     tx: 0.0, ty: 0.0)),

          ])
    func initRotate(_ args: (MKAngle<Float>, MKAffineTransform<Float>)) {
        let (angle, expect) = args
        #expect(MKAffineTransform<Float>(angle).isEqual(to: expect, tolerance: halfTolerance))
        #expect(MKAffineTransform<Float>.rotation(angle).isEqual(to: expect, tolerance: halfTolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(rotationAngle: .init(angle.radians))
            #expect(MKAffineTransform<Float>(cg).isEqual(to: expect, tolerance: halfTolerance))
        #endif

        #if os(macOS)
            let affine = AffineTransform(rotationByRadians: .init(angle.radians))
            #expect(MKAffineTransform<Float>(affine).isEqual(to: expect, tolerance: halfTolerance))
        #endif
    }

    @Test("Constructor Rotation <Float16>",
          arguments: [
              (MKAngle<Float16>.zero, MKAffineTransform<Float16>.identity),
              (MKAngle<Float16>(radians: .pi / 2), MKAffineTransform<Float16>(m11: 0, m12: 1.0, m21: -1.0, m22: 0, tx: 0.0, ty: 0.0)),
              (MKAngle<Float16>(radians: .pi), MKAffineTransform<Float16>(m11: -1.0, m12: 0, m21: 0, m22: -1.0, tx: 0.0, ty: 0.0)),
              (MKAngle<Float16>(radians: .pi / 8), MKAffineTransform<Float16>(m11: 0.9238795325112866, m12: 0.3826834323650898,
                                                                              m21: -0.3826834323650898, m22: 0.9238795325112866,
                                                                              tx: 0.0, ty: 0.0)),

              (MKAngle<Float16>(degrees: 66), MKAffineTransform<Float16>(m11: 0.4067366430758002, m12: 0.9135454576426009,
                                                                         m21: -0.9135454576426009, m22: 0.4067366430758002,
                                                                         tx: 0.0, ty: 0.0)),

          ])
    func initRotate(_ args: (MKAngle<Float16>, MKAffineTransform<Float16>)) {
        let (angle, expect) = args
        #expect(MKAffineTransform<Float16>(angle).isEqual(to: expect, tolerance: lowTolerance))
        #expect(MKAffineTransform<Float16>.rotation(angle).isEqual(to: expect, tolerance: lowTolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(rotationAngle: .init(angle.radians))
            #expect(MKAffineTransform<Float16>(cg).isEqual(to: expect, tolerance: lowTolerance))
        #endif

        #if os(macOS)
            let affine = AffineTransform(rotationByRadians: .init(angle.radians))
            #expect(MKAffineTransform<Float16>(affine).isEqual(to: expect, tolerance: lowTolerance))
        #endif
    }
}

extension MKAffineTransformTests {
    @Test("Rotate<Double>",
          arguments: [
              (MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<Double>.zero,
               MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)),

              (MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<Double>.radians(.pi / 4),
               MKAffineTransform<Double>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                         m21: 1.4142135623730954, m22: 1.4142135623730956,
                                         tx: 5.0, ty: 6.0)),

          ])
    func rotateDouble(_ args: (MKAffineTransform<Double>, MKAngle<Double>, MKAffineTransform<Double>)) {
        let (src, angle, expect) = args

        #expect(src.rotated(angle).isEqual(to: expect, tolerance: tolerance))

        var tr = src
        tr.rotate(angle)

        #expect(tr.isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(src)
            let rotated = cg.rotated(by: angle.radians)
            #expect(MKAffineTransform<Double>(rotated).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            var affine = AffineTransform(src)
            affine.rotate(byRadians: angle.radians)
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("Rotate<CGFloat>",
          arguments: [
              (MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<CGFloat>.zero,
               MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)),

              (MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<CGFloat>.radians(.pi / 4),
               MKAffineTransform<CGFloat>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                          m21: 1.4142135623730954, m22: 1.4142135623730956,
                                          tx: 5.0, ty: 6.0)),

          ])
    func rotateCGFloat(_ args: (MKAffineTransform<CGFloat>, MKAngle<CGFloat>, MKAffineTransform<CGFloat>)) {
        let (src, angle, expect) = args

        #expect(src.rotated(angle).isEqual(to: expect, tolerance: tolerance))

        var tr = src
        tr.rotate(angle)

        #expect(tr.isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(src)
            let rotated = cg.rotated(by: angle.radians)
            #expect(MKAffineTransform<CGFloat>(rotated).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            var affine = AffineTransform(src)
            affine.rotate(byRadians: angle.radians)
            #expect(MKAffineTransform<CGFloat>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("Rotate<Float>",
          arguments: [
              (MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<Float>.zero,
               MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)),

              (MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<Float>.radians(.pi / 4),
               MKAffineTransform<Float>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                        m21: 1.4142135623730954, m22: 1.4142135623730956,
                                        tx: 5.0, ty: 6.0)),

          ])
    func rotateFloat(_ args: (MKAffineTransform<Float>, MKAngle<Float>, MKAffineTransform<Float>)) {
        let (src, angle, expect) = args

        #expect(src.rotated(angle).isEqual(to: expect, tolerance: halfTolerance))

        var tr = src
        tr.rotate(angle)

        #expect(tr.isEqual(to: expect, tolerance: halfTolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(src)
            let rotated = cg.rotated(by: .init(angle.radians))
            #expect(MKAffineTransform<Float>(rotated).isEqual(to: expect, tolerance: halfTolerance))
        #endif

        #if os(macOS)
            var affine = AffineTransform(src)
            affine.rotate(byRadians: .init(angle.radians))
            #expect(MKAffineTransform<Float>(affine).isEqual(to: expect, tolerance: halfTolerance))
        #endif
    }

    @Test("Rotate<Float16>",
          arguments: [
              (MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<Float16>.zero,
               MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)),

              (MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
               MKAngle<Float16>.radians(.pi / 4),
               MKAffineTransform<Float16>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                          m21: 1.4142135623730954, m22: 1.4142135623730956,
                                          tx: 5.0, ty: 6.0)),

          ])
    func rotateFloat16(_ args: (MKAffineTransform<Float16>, MKAngle<Float16>, MKAffineTransform<Float16>)) {
        let (src, angle, expect) = args

        #expect(src.rotated(angle).isEqual(to: expect, tolerance: lowTolerance))

        var tr = src
        tr.rotate(angle)

        #expect(tr.isEqual(to: expect, tolerance: lowTolerance))

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(src)
            let rotated = cg.rotated(by: .init(angle.radians))
            #expect(MKAffineTransform<Float16>(rotated).isEqual(to: expect, tolerance: lowTolerance))
        #endif

        #if os(macOS)
            var affine = AffineTransform(src)
            affine.rotate(byRadians: .init(angle.radians))
            #expect(MKAffineTransform<Float16>(affine).isEqual(to: expect, tolerance: lowTolerance))
        #endif
    }
}
