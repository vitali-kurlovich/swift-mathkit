//
//  Created by Vitali Kurlovich on 12.01.26.
//

import Foundation

#if canImport(simd)
    import simd

    public extension MKAngle where Float: BinaryFloatingPoint {
        @inlinable var sincos: (Float, Float) {
            let double = Double(radians)

            let simdAngle = SIMD2<Double>(double, double)
            let (s, c) = simd.sincos(simdAngle)

            return (Float(s.x), Float(c.x))
        }
    }

#else

    public extension MKAngle where Float: BinaryFloatingPoint {
        @inlinable var sincos: (Float, Float) {
            let s = sin(Double(radians))
            let c = cos(Double(radians))

            return (Float(s), Float(c))
        }
    }

#endif
