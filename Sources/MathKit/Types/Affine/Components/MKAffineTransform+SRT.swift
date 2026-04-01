//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation

public extension MKAffineTransform {
    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Double {
        let (x, y) = (scale.width, scale.height)
        let (s, c) = rotation.sincos
        let (tx, ty) = (translation.dx, translation.dy)

        self.init(m11: c * x, m12: s * y,
                  m21: -s * x, m22: c * y,
                  tx: (c * tx - s * ty) * x, ty: (s * tx + c * ty) * y)
    }

    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Swift.Float {
        let (x, y) = (scale.width, scale.height)
        let (s, c) = rotation.sincos
        let (tx, ty) = (translation.dx, translation.dy)

        self.init(m11: c * x, m12: s * y,
                  m21: -s * x, m22: c * y,
                  tx: (c * tx - s * ty) * x, ty: (s * tx + c * ty) * y)
    }

    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == CGFloat {
        let (x, y) = (scale.width, scale.height)
        let (s, c) = rotation.sincos
        let (tx, ty) = (translation.dx, translation.dy)

        self.init(m11: c * x, m12: s * y,
                  m21: -s * x, m22: c * y,
                  tx: (c * tx - s * ty) * x, ty: (s * tx + c * ty) * y)
    }

    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Float16 {
        let (x, y) = (scale.width, scale.height)
        let (s, c) = rotation.sincos
        let (tx, ty) = (translation.dx, translation.dy)

        self.init(m11: c * x, m12: s * y,
                  m21: -s * x, m22: c * y,
                  tx: (c * tx - s * ty) * x, ty: (s * tx + c * ty) * y)
    }
}
