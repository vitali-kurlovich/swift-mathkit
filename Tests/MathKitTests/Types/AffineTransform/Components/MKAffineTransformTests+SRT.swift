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
    @Test("Scale-Rotate-Translate <Double>")
    func srt_Double() {
        let size: MKSize<Double> = .init(width: 2, height: 3)
        let scale: MKAffineTransform<Double> = .scale(size)

        let angle: MKAngle<Double> = .radians(.pi / 4)
        let rotate: MKAffineTransform<Double> = .rotation(angle)

        let offset: MKVector<Double> = .init(dx: 20, dy: 40)
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

    @Test("Scale-Rotate-Translate <CGFloat>")
    func srt_CGFloat() {
        let size: MKSize<CGFloat> = .init(width: 2, height: 3)
        let scale: MKAffineTransform<CGFloat> = .scale(size)

        let angle: MKAngle<CGFloat> = .radians(.pi / 4)
        let rotate: MKAffineTransform<CGFloat> = .rotation(angle)

        let offset: MKVector<CGFloat> = .init(dx: 20, dy: 40)
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

    @Test("Scale-Rotate-Translate <Float>")
    func srt_Float() {
        let size: MKSize<Float> = .init(width: 2, height: 3)
        let scale: MKAffineTransform<Float> = .scale(size)

        let angle: MKAngle<Float> = .radians(.pi / 4)
        let rotate: MKAffineTransform<Float> = .rotation(angle)

        let offset: MKVector<Float> = .init(dx: 20, dy: 40)
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

    @Test("Scale-Rotate-Translate <Float16>")
    func srt_Float16() {
        let size: MKSize<Float16> = .init(width: 2, height: 3)
        let scale: MKAffineTransform<Float16> = .scale(size)

        let angle: MKAngle<Float16> = .radians(.pi / 4)
        let rotate: MKAffineTransform<Float16> = .rotation(angle)

        let offset: MKVector<Float16> = .init(dx: 20, dy: 40)
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
