//
//  Created by Vitali Kurlovich on 12.01.26.
//

import Foundation

#if canImport(simd)
    import simd

    public extension MKAngle where Float: BinaryFloatingPoint {
        @inlinable var sincos: (Float, Float) {
            let vec: simd_double2 = SIMD2<Double>(x: Double(radians), y: .pi / 2 - Double(radians))
            let sincos = simd.sin(vec)

            return (Float(sincos.x), Float(sincos.y))
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
