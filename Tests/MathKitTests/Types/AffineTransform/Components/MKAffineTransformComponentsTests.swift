//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000000000001
private let halfTolerance: Float32 = 0.00001
private let lowTolerance: Float16 = 0.1

@Suite("MKAffineTransformComponents")
struct MKAffineTransformComponentsTests {}

extension MKAffineTransformComponentsTests {
    @Test("Identity")
    func identity() {
        let tr = MKAffineTransform<Double>.identity
        let components = tr.decomposed()

        #expect(components.scale == MKSize<Double>(width: 1, height: 1))
        #expect(components.rotation == .zero)
        #expect(components.translation == .zero)
    }

    @Test("Translate")
    func translate() {
        var tr = MKAffineTransform<Double>.identity

        let translation: MKVector<Double> = .init(dx: 20, dy: 40)
        tr.translate(translation)

        let components = tr.decomposed()

        #expect(components.scale == .identity)
        #expect(components.rotation == .zero)
        #expect(components.translation == translation)
    }

    @Test("Scale")
    func scale() {
        var tr = MKAffineTransform<Double>.identity

        let size: MKSize<Double> = .init(width: 2, height: 3)
        tr.scale(size)

        let components = tr.decomposed()

        #expect(components.scale == size)
        #expect(components.rotation == .zero)
        #expect(components.translation == .zero)
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
    }

    // 𝑇∗𝑅∗𝑆
    // Scale, Rotate, Translate
    @Test("Scale-Rotate-Translate <Double>")
    func trs_Double() {
        let size: MKSize<Double> = .init(width: 2, height: 3)
        let angle: MKAngle<Double> = .radians(.pi / 4)
        let offset: MKVector<Double> = .init(dx: 20, dy: 40)

        var tr = MKAffineTransform<Double>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: size, tolerance: tolerance))
        #expect(components.rotation.isEqual(to: .radians(.pi / 4), tolerance: tolerance))

        #expect(components.translation.isEqual(to: offset, tolerance: tolerance))
    }

    @Test("Scale-Rotate-Translate <CGFloat>")
    func trs_CGFloat() {
        let size: MKSize<CGFloat> = .init(width: 2, height: 3)
        let angle: MKAngle<CGFloat> = .radians(.pi / 4)
        let offset: MKVector<CGFloat> = .init(dx: 20, dy: 40)

        var tr = MKAffineTransform<CGFloat>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: size, tolerance: tolerance))
        #expect(components.rotation.isEqual(to: .radians(.pi / 4), tolerance: tolerance))

        #expect(components.translation.isEqual(to: offset, tolerance: tolerance))
    }

    @Test("Scale-Rotate-Translate <Float>")
    func trs_Float() {
        let size: MKSize<Float> = .init(width: 2, height: 3)
        let angle: MKAngle<Float> = .radians(.pi / 4)
        let offset: MKVector<Float> = .init(dx: 20, dy: 40)

        var tr = MKAffineTransform<Float>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: size, tolerance: halfTolerance))
        #expect(components.rotation.isEqual(to: .radians(.pi / 4), tolerance: halfTolerance))

        #expect(components.translation.isEqual(to: offset, tolerance: halfTolerance))
    }

    @Test("Scale-Rotate-Translate <Float16>")
    func trs_Float16() {
        let size: MKSize<Float16> = .init(width: 2, height: 3)
        let angle: MKAngle<Float16> = .radians(.pi / 4)
        let offset: MKVector<Float16> = .init(dx: 20, dy: 40)

        var tr = MKAffineTransform<Float16>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        let components = tr.decomposed()

        #expect(components.scale.isEqual(to: size, tolerance: lowTolerance))
        #expect(components.rotation.isEqual(to: .radians(.pi / 4), tolerance: 0.001))
        #expect(components.translation.isEqual(to: offset, tolerance: lowTolerance))
    }
}
