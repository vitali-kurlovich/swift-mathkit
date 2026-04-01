//
//  Created by Vitali Kurlovich on 6.01.26.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

@Suite("MKAffineTransform")
struct MKAffineTransformTests {}

extension MKAffineTransformTests {
    @Test("Scale-Rotate-Translate")
    func trs() {
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
    }
}

/*

 // 𝑇∗𝑅∗𝑆
 // Scale, Rotate, Translate
 @Test("Scale-Rotate-Translate")
 func trs() {
     var tr = MKAffineTransform<Double>.identity

      let size: MKSize<Double> = .init(width: 2, height: 3)
      tr.scale(size)

     let angle: MKAngle<Double> = .radians(.pi/4)
     tr.rotate(angle)

     let translation: MKVector<Double> = .init(dx: 20, dy: 40)
     tr.translate(translation)

     let components = tr.decomposed()

     #expect(components.scale.isEqual(to: size, tolerance: tolerance) )
     #expect(components.rotation.isEqual(to:  .radians(.pi/4)  , tolerance: 0.001))
     #expect(components.translation == translation)

 }
 */
