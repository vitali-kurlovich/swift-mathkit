//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

private let tolerance: Double = 0.00000000000001
private let halfTolerance: Float32 = 0.00001
private let lowTolerance: Float16 = 0.1

@Suite("MKAffineTransformComponents")
struct MKAffineTransformComponentsTests {}

extension MKAffineTransformComponentsTests {
    @Test("Zero")
    func zero() {
        #expect(MKAffineTransformComponents<Double>.zero.translation == .zero)
        #expect(MKAffineTransformComponents<Double>.zero.rotation == .zero)
        #expect(MKAffineTransformComponents<Double>.zero.scale == .identity)
    }
}

extension MKAffineTransformComponentsTests {
    @Test("Identity <Double>")
    func identityDouble() {
        let tr = MKAffineTransform<Double>.identity
        let components = tr.decomposed()

        #expect(components.scale == MKSize<Double>.identity)
        #expect(components.rotation == .zero)
        #expect(components.translation == .zero)

        let transformComponents = MKAffineTransformComponents<Double>()

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: tolerance)
        )

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform.identity
            let comps = cg.decomposed()
            #expect(comps.scale == .init(width: 1, height: 1))
            #expect(comps.rotation == .zero)
            #expect(comps.translation == .zero)
        #endif
    }

    @Test("Identity <Float>")
    func identityFloat() {
        let tr = MKAffineTransform<Float>.identity
        let components = tr.decomposed()

        #expect(components.scale == MKSize<Float>.identity)
        #expect(components.rotation == .zero)
        #expect(components.translation == .zero)

        let transformComponents = MKAffineTransformComponents<Float>()

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: halfTolerance)
        )
    }

    @Test("Identity <Float16>")
    func identityFloat16() {
        let tr = MKAffineTransform<Float16>.identity
        let components = tr.decomposed()

        #expect(components.scale == MKSize<Float16>.identity)
        #expect(components.rotation == .zero)
        #expect(components.translation == .zero)

        let transformComponents = MKAffineTransformComponents<Float16>()

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: lowTolerance)
        )
    }
}

extension MKAffineTransformComponentsTests {
    @Test("Translate <Double>")
    func translateDouble() {
        var tr = MKAffineTransform<Double>.identity

        let translation: MKVector<Double> = .init(dx: 20, dy: 40)
        tr.translate(translation)

        let components = tr.decomposed()

        #expect(components.scale == .identity)
        #expect(components.rotation == .zero)
        #expect(components.translation == translation)

        let transformComponents = MKAffineTransformComponents(translation: components.translation)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr == transform
        )

        #if canImport(CoreGraphics)
            var cg = CGAffineTransform.identity
            cg = cg.translatedBy(x: translation.dx, y: translation.dy)

            let comps = cg.decomposed()
            #expect(comps.scale == .init(width: 1, height: 1))
            #expect(comps.rotation == .zero)
            #expect(comps.translation == CGVector(dx: translation.dx, dy: translation.dy))
        #endif
    }

    @Test("Translate <Float>")
    func translateFloat() {
        var tr = MKAffineTransform<Float>.identity

        let translation: MKVector<Float> = .init(dx: 20, dy: 40)
        tr.translate(translation)

        let components = tr.decomposed()

        #expect(components.scale == .identity)
        #expect(components.rotation == .zero)
        #expect(components.translation == translation)

        let transformComponents = MKAffineTransformComponents(translation: components.translation)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr == transform
        )
    }

    @Test("Translate <Float16>")
    func translateFloat16() {
        var tr = MKAffineTransform<Float16>.identity

        let translation: MKVector<Float16> = .init(dx: 20, dy: 40)
        tr.translate(translation)

        let components = tr.decomposed()

        #expect(components.scale == .identity)
        #expect(components.rotation == .zero)
        #expect(components.translation == translation)

        let transformComponents = MKAffineTransformComponents(translation: components.translation)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr == transform
        )
    }
}

extension MKAffineTransformComponentsTests {
    @Test("Scale")
    func scale() {
        var tr = MKAffineTransform<Double>.identity

        let size: MKSize<Double> = .init(width: 2, height: 3)
        tr.scale(size)

        let components = tr.decomposed()

        #expect(components.scale == size)
        #expect(components.rotation == .zero)
        #expect(components.translation == .zero)

        let transformComponents = MKAffineTransformComponents(translation: components.translation,
                                                              rotation: components.rotation,
                                                              scale: components.scale)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: tolerance)
        )
    }

    @Test("Rotate")
    func rotate() {
        var tr = MKAffineTransform<Double>.identity

        let angle: MKAngle<Double> = .radians(.pi / 4)
        tr.rotate(angle)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: .identity, tolerance: tolerance))
        #expect(components.rotation.isEqual(to: .radians(.pi / 4), tolerance: tolerance))
        #expect(components.translation == .zero)

        let transformComponents = MKAffineTransformComponents(translation: components.translation,
                                                              rotation: components.rotation,
                                                              scale: components.scale)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: tolerance)
        )
    }
}

extension MKAffineTransformComponentsTests {
    @Test("Translate.Rotate.Scale <Double>",
          arguments: [
              (MKSize<Double>.identity, MKAngle<Double>.zero, MKVector<Double>.zero),
              (MKSize<Double>.identity, MKAngle<Double>.zero, MKVector<Double>(dx: 20, dy: 40)),
              (MKSize<Double>.identity, MKAngle<Double>.radians(.pi / 4), MKVector<Double>(dx: 20, dy: 40)),

              // ---
              (MKSize<Double>(width: 2, height: 3), MKAngle<Double>.zero, MKVector<Double>.zero),
              (MKSize<Double>(width: 2, height: 3), MKAngle<Double>.zero, MKVector<Double>(dx: 20, dy: 40)),
              (MKSize<Double>(width: 2, height: 3), MKAngle<Double>.radians(.pi / 4), MKVector<Double>.zero),
          ])
    func trs_Double(_ args: (MKSize<Double>, MKAngle<Double>, MKVector<Double>)) {
        let (scale, angle, offset) = args

        var tr = MKAffineTransform<Double>.identity
        tr.translate(offset)
        tr.rotate(angle)
        tr.scale(scale)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: scale, tolerance: tolerance))
        #expect(components.rotation.isEqual(to: angle, tolerance: tolerance))
        #expect(components.translation.isEqual(to: offset, tolerance: tolerance))

        let transformComponents = MKAffineTransformComponents(translation: components.translation,
                                                              rotation: components.rotation,
                                                              scale: components.scale)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: tolerance)
        )
    }

    @Test("Translate.Rotate.Scale <CGFloat>",
          arguments: [
              (MKSize<CGFloat>.identity, MKAngle<CGFloat>.zero, MKVector<CGFloat>.zero),
              (MKSize<CGFloat>.identity, MKAngle<CGFloat>.zero, MKVector<CGFloat>(dx: 20, dy: 40)),
              (MKSize<CGFloat>.identity, MKAngle<CGFloat>.radians(.pi / 4), MKVector<CGFloat>(dx: 20, dy: 40)),

              // ---
              (MKSize<CGFloat>(width: 2, height: 3), MKAngle<CGFloat>.zero, MKVector<CGFloat>.zero),
              (MKSize<CGFloat>(width: 2, height: 3), MKAngle<CGFloat>.zero, MKVector<CGFloat>(dx: 20, dy: 40)),
              (MKSize<CGFloat>(width: 2, height: 3), MKAngle<CGFloat>.radians(.pi / 4), MKVector<CGFloat>.zero),
          ])
    func trs_CGFloat(_ args: (MKSize<CGFloat>, MKAngle<CGFloat>, MKVector<CGFloat>)) {
        let (scale, angle, offset) = args

        var tr = MKAffineTransform<CGFloat>.identity
        tr.translate(offset)
        tr.rotate(angle)
        tr.scale(scale)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: scale, tolerance: tolerance))
        #expect(components.rotation.isEqual(to: angle, tolerance: tolerance))
        #expect(components.translation.isEqual(to: offset, tolerance: tolerance))

        let transformComponents = MKAffineTransformComponents(translation: components.translation,
                                                              rotation: components.rotation,
                                                              scale: components.scale)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: tolerance)
        )
    }

    @Test("Translate.Rotate.Scale <Float>",
          arguments: [
              (MKSize<Float>.identity, MKAngle<Float>.zero, MKVector<Float>.zero),
              (MKSize<Float>.identity, MKAngle<Float>.zero, MKVector<Float>(dx: 20, dy: 40)),
              (MKSize<Float>.identity, MKAngle<Float>.radians(.pi / 4), MKVector<Float>(dx: 20, dy: 40)),

              // ---
              (MKSize<Float>(width: 2, height: 3), MKAngle<Float>.zero, MKVector<Float>.zero),
              (MKSize<Float>(width: 2, height: 3), MKAngle<Float>.zero, MKVector<Float>(dx: 20, dy: 40)),
              (MKSize<Float>(width: 2, height: 3), MKAngle<Float>.radians(.pi / 4), MKVector<Float>.zero),
          ])
    func trs_Float(_ args: (MKSize<Float>, MKAngle<Float>, MKVector<Float>)) {
        let (scale, angle, offset) = args

        var tr = MKAffineTransform<Float>.identity
        tr.translate(offset)
        tr.rotate(angle)
        tr.scale(scale)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: scale, tolerance: halfTolerance))
        #expect(components.rotation.isEqual(to: angle, tolerance: halfTolerance))
        #expect(components.translation.isEqual(to: offset, tolerance: halfTolerance))

        let transformComponents = MKAffineTransformComponents(translation: components.translation,
                                                              rotation: components.rotation,
                                                              scale: components.scale)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: halfTolerance)
        )
    }

    @Test("Translate.Rotate.Scale <Float16>",
          arguments: [
              (MKSize<Float16>.identity, MKAngle<Float16>.zero, MKVector<Float16>.zero),
              (MKSize<Float16>.identity, MKAngle<Float16>.zero, MKVector<Float16>(dx: 20, dy: 40)),
              (MKSize<Float16>.identity, MKAngle<Float16>.radians(.pi / 4), MKVector<Float16>(dx: 20, dy: 40)),

              // ---
              (MKSize<Float16>(width: 2, height: 3), MKAngle<Float16>.zero, MKVector<Float16>.zero),
              (MKSize<Float16>(width: 2, height: 3), MKAngle<Float16>.zero, MKVector<Float16>(dx: 20, dy: 40)),
              (MKSize<Float16>(width: 2, height: 3), MKAngle<Float16>.radians(.pi / 4), MKVector<Float16>.zero),
          ])
    func trs_Float16(_ args: (MKSize<Float16>, MKAngle<Float16>, MKVector<Float16>)) {
        let (scale, angle, offset) = args

        var tr = MKAffineTransform<Float16>.identity
        tr.translate(offset)
        tr.rotate(angle)
        tr.scale(scale)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: scale, tolerance: lowTolerance))
        #expect(components.rotation.isEqual(to: angle, tolerance: lowTolerance))
        #expect(components.translation.isEqual(to: offset, tolerance: lowTolerance))

        let transformComponents = MKAffineTransformComponents(translation: components.translation,
                                                              rotation: components.rotation,
                                                              scale: components.scale)

        let transform = MKAffineTransform(transformComponents)

        #expect(
            tr.isEqual(to: transform, tolerance: lowTolerance)
        )
    }
}
