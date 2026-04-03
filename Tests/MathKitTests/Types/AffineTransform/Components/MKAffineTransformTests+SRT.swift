//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

extension MKAffineTransformTests {
    @Test("Scale-Rotate-Translate <Double>", arguments: [
        (MKSize<Double>.identity, MKAngle<Double>.zero, MKVector<Double>.zero),
        (MKSize<Double>.identity, MKAngle<Double>.zero, MKVector<Double>(dx: 20, dy: 40)),
        (MKSize<Double>.identity, MKAngle<Double>.radians(.pi / 4), MKVector<Double>(dx: 20, dy: 40)),
        // ---
        (MKSize<Double>(width: 2, height: 3), MKAngle<Double>.zero, MKVector<Double>.zero),
        (MKSize<Double>(width: 2, height: 3), MKAngle<Double>.zero, MKVector<Double>(dx: 20, dy: 40)),
        (MKSize<Double>(width: 2, height: 3), MKAngle<Double>.radians(.pi / 4), MKVector<Double>.zero),

    ])
    func srt_Double(_ args: (MKSize<Double>, MKAngle<Double>, MKVector<Double>)) {
        let (size, angle, offset) = args

        let scale: MKAffineTransform<Double> = .scale(size)
        let rotate: MKAffineTransform<Double> = .rotation(angle)
        let translation: MKAffineTransform<Double> = .translation(offset)

        // 𝑇∗𝑅∗𝑆
        let tsr = translation.appended(rotate).appended(scale)

        var tr = MKAffineTransform<Double>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        #expect(tsr.isEqual(to: tr, tolerance: tolerance))

        let components = MKAffineTransformComponents(scale: size, rotation: angle, translation: offset)
        let srt = MKAffineTransform(components)

        #expect(srt.isEqual(to: tr, tolerance: tolerance))
    }

    @Test("Scale-Rotate-Translate <CGFloat>", arguments: [
        (MKSize<CGFloat>.identity, MKAngle<CGFloat>.zero, MKVector<CGFloat>.zero),
        (MKSize<CGFloat>.identity, MKAngle<CGFloat>.zero, MKVector<CGFloat>(dx: 20, dy: 40)),
        (MKSize<CGFloat>.identity, MKAngle<CGFloat>.radians(.pi / 4), MKVector<CGFloat>(dx: 20, dy: 40)),
        // ---
        (MKSize<CGFloat>(width: 2, height: 3), MKAngle<CGFloat>.zero, MKVector<CGFloat>.zero),
        (MKSize<CGFloat>(width: 2, height: 3), MKAngle<CGFloat>.zero, MKVector<CGFloat>(dx: 20, dy: 40)),
        (MKSize<CGFloat>(width: 2, height: 3), MKAngle<CGFloat>.radians(.pi / 4), MKVector<CGFloat>.zero),

    ])
    func srt_CGFloat(_ args: (MKSize<CGFloat>, MKAngle<CGFloat>, MKVector<CGFloat>)) {
        let (size, angle, offset) = args

        let scale: MKAffineTransform<CGFloat> = .scale(size)
        let rotate: MKAffineTransform<CGFloat> = .rotation(angle)
        let translation: MKAffineTransform<CGFloat> = .translation(offset)

        // 𝑇∗𝑅∗𝑆
        let tsr = translation.appended(rotate).appended(scale)

        var tr = MKAffineTransform<CGFloat>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        #expect(tsr.isEqual(to: tr, tolerance: tolerance))

        let components = MKAffineTransformComponents(scale: size, rotation: angle, translation: offset)
        let srt = MKAffineTransform(components)

        #expect(srt.isEqual(to: tr, tolerance: tolerance))
    }

    @Test("Scale-Rotate-Translate <Float>", arguments: [
        (MKSize<Float>.identity, MKAngle<Float>.zero, MKVector<Float>.zero),
        (MKSize<Float>.identity, MKAngle<Float>.zero, MKVector<Float>(dx: 20, dy: 40)),
        (MKSize<Float>.identity, MKAngle<Float>.radians(.pi / 4), MKVector<Float>(dx: 20, dy: 40)),
        // ---
        (MKSize<Float>(width: 2, height: 3), MKAngle<Float>.zero, MKVector<Float>.zero),
        (MKSize<Float>(width: 2, height: 3), MKAngle<Float>.zero, MKVector<Float>(dx: 20, dy: 40)),
        (MKSize<Float>(width: 2, height: 3), MKAngle<Float>.radians(.pi / 4), MKVector<Float>.zero),

    ])
    func srt_Float(_ args: (MKSize<Float>, MKAngle<Float>, MKVector<Float>)) {
        let (size, angle, offset) = args

        let scale: MKAffineTransform<Float> = .scale(size)
        let rotate: MKAffineTransform<Float> = .rotation(angle)
        let translation: MKAffineTransform<Float> = .translation(offset)

        // 𝑇∗𝑅∗𝑆
        let tsr = translation.appended(rotate).appended(scale)

        var tr = MKAffineTransform<Float>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        #expect(tsr.isEqual(to: tr, tolerance: halfTolerance))

        let components = MKAffineTransformComponents(scale: size, rotation: angle, translation: offset)
        let srt = MKAffineTransform(components)

        #expect(srt.isEqual(to: tr, tolerance: halfTolerance))
    }

    @Test("Scale-Rotate-Translate <Float16>", arguments: [
        (MKSize<Float16>.identity, MKAngle<Float16>.zero, MKVector<Float16>.zero),
        (MKSize<Float16>.identity, MKAngle<Float16>.zero, MKVector<Float16>(dx: 20, dy: 40)),
        (MKSize<Float16>.identity, MKAngle<Float16>.radians(.pi / 4), MKVector<Float16>(dx: 20, dy: 40)),
        // ---
        (MKSize<Float16>(width: 2, height: 3), MKAngle<Float16>.zero, MKVector<Float16>.zero),
        (MKSize<Float16>(width: 2, height: 3), MKAngle<Float16>.zero, MKVector<Float16>(dx: 20, dy: 40)),
        (MKSize<Float16>(width: 2, height: 3), MKAngle<Float16>.radians(.pi / 4), MKVector<Float16>.zero),

    ])
    func srt_Float16(_ args: (MKSize<Float16>, MKAngle<Float16>, MKVector<Float16>)) {
        let (size, angle, offset) = args

        let scale: MKAffineTransform<Float16> = .scale(size)
        let rotate: MKAffineTransform<Float16> = .rotation(angle)
        let translation: MKAffineTransform<Float16> = .translation(offset)

        // 𝑇∗𝑅∗𝑆
        let tsr = translation.appended(rotate).appended(scale)

        var tr = MKAffineTransform<Float16>.identity
        tr.scale(size)
        tr.rotate(angle)
        tr.translate(offset)

        #expect(tsr.isEqual(to: tr, tolerance: lowTolerance))

        let components = MKAffineTransformComponents(scale: size, rotation: angle, translation: offset)
        let srt = MKAffineTransform(components)

        #expect(srt.isEqual(to: tr, tolerance: lowTolerance))
    }
}
