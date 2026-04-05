//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation

public extension MKAffineTransform {
    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Double {
        var tr = MKAffineTransform<Float>.identity
        tr.translate(translation)
        tr.rotate(rotation)
        tr.scale(scale)
        self = tr
    }

    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Swift.Float {
        var tr = MKAffineTransform<Float>.identity
        tr.translate(translation)
        tr.rotate(rotation)
        tr.scale(scale)
        self = tr
    }

    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == CGFloat {
        var tr = MKAffineTransform<Float>.identity
        tr.translate(translation)
        tr.rotate(rotation)
        tr.scale(scale)
        self = tr
    }

    /// Scale, Rotate, Translate
    @inlinable init(scale: MKSize<Float>, rotation: MKAngle<Float>, translation: MKVector<Float>) where Float == Float16 {
        var tr = MKAffineTransform<Float>.identity
        tr.translate(translation)
        tr.rotate(rotation)
        tr.scale(scale)
        self = tr
    }
}
