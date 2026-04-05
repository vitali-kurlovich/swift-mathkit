//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation

public extension MKAffineTransform {
    /// Translate   Rotate  Scale
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Double {
        if rotation == .zero {
            self.init(m11: 1, m12: 0,
                      m21: 0, m22: 1,
                      tx: translation.dx, ty: translation.dy)

        } else {
            let (s, c) = rotation.sincos

            self.init(m11: c, m12: s,
                      m21: -s, m22: c,
                      tx: translation.dx, ty: translation.dy)
        }

        if scale != .identity {
            m11 *= scale.width
            m12 *= scale.width
            m21 *= scale.height
            m22 *= scale.height
        }
    }

    /// Translate   Rotate  Scale
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Swift.Float {
        if rotation == .zero {
            self.init(m11: 1, m12: 0,
                      m21: 0, m22: 1,
                      tx: translation.dx, ty: translation.dy)

        } else {
            let (s, c) = rotation.sincos

            self.init(m11: c, m12: s,
                      m21: -s, m22: c,
                      tx: translation.dx, ty: translation.dy)
        }

        if scale != .identity {
            m11 *= scale.width
            m12 *= scale.width
            m21 *= scale.height
            m22 *= scale.height
        }
    }

    /// Translate   Rotate  Scale
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == CGFloat {
        if rotation == .zero {
            self.init(m11: 1, m12: 0,
                      m21: 0, m22: 1,
                      tx: translation.dx, ty: translation.dy)

        } else {
            let (s, c) = rotation.sincos

            self.init(m11: c, m12: s,
                      m21: -s, m22: c,
                      tx: translation.dx, ty: translation.dy)
        }

        if scale != .identity {
            m11 *= scale.width
            m12 *= scale.width
            m21 *= scale.height
            m22 *= scale.height
        }
    }

    /// Translate   Rotate  Scale
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Float16 {
        if rotation == .zero {
            self.init(m11: 1, m12: 0,
                      m21: 0, m22: 1,
                      tx: translation.dx, ty: translation.dy)

        } else {
            let (s, c) = rotation.sincos

            self.init(m11: c, m12: s,
                      m21: -s, m22: c,
                      tx: translation.dx, ty: translation.dy)
        }

        if scale != .identity {
            m11 *= scale.width
            m12 *= scale.width
            m21 *= scale.height
            m22 *= scale.height
        }
    }
}
