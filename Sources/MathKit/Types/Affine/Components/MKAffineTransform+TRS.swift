//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation

public extension MKAffineTransform where Float == Double {
    /// Translate   Rotate  Scale
    @inlinable init(translation: MKVector<Float> = .zero,
                    rotation: MKAngle<Float> = .zero,
                    scale: MKSize<Float> = .identity)
    {
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

    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) {
        self.init(translation: components.translation, rotation: components.rotation, scale: components.scale)
    }
}

public extension MKAffineTransform where Float == Swift.Float {
    /// Translate   Rotate  Scale
    @inlinable init(translation: MKVector<Float> = .zero,
                    rotation: MKAngle<Float> = .zero,
                    scale: MKSize<Float> = .identity)
    {
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

    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) {
        self.init(translation: components.translation, rotation: components.rotation, scale: components.scale)
    }
}

public extension MKAffineTransform where Float == CGFloat {
    /// Translate   Rotate  Scale
    @inlinable init(translation: MKVector<Float> = .zero,
                    rotation: MKAngle<Float> = .zero,
                    scale: MKSize<Float> = .identity)
    {
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

    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) {
        self.init(translation: components.translation, rotation: components.rotation, scale: components.scale)
    }
}

public extension MKAffineTransform where Float == Float16 {
    /// Translate   Rotate  Scale
    @inlinable init(translation: MKVector<Float> = .zero,
                    rotation: MKAngle<Float> = .zero,
                    scale: MKSize<Float> = .identity)
    {
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

    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) {
        self.init(translation: components.translation, rotation: components.rotation, scale: components.scale)
    }
}
