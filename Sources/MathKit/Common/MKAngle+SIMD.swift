//
//  MKAngle+SIMD.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 12.01.26.
//

import Foundation
import simd

public extension MKAngle where Float == Double {
    var sincos: (Float, Float) {
        if radians == 0 {
            return (0, 1)
        }

        let simdAngle = SIMD2<Double>(radians, radians)
        let (s, c) = simd.sincos(simdAngle)
        return (s.x, c.x)
    }
}

public extension MKAngle where Float == Swift.Float {
    var sincos: (Float, Float) {
        if radians == 0 {
            return (0, 1)
        }

        let simdAngle = SIMD2(radians, radians)
        let (s, c) = simd.sincos(simdAngle)
        return (s.x, c.x)
    }
}

public extension MKAngle where Float == Float16 {
    var sincos: (Float, Float) {
        if radians == 0 {
            return (0, 1)
        }

        let simdAngle = SIMD2(Swift.Float(radians), Swift.Float(radians))
        let (s, c) = simd.sincos(simdAngle)
        return (Float(s.x), Float(c.x))
    }
}

public extension MKAngle where Float == CGFloat {
    var sincos: (Float, Float) {
        if radians == 0 {
            return (0, 1)
        }

        let simdAngle = SIMD2(Double(radians), Double(radians))
        let (s, c) = simd.sincos(simdAngle)
        return (Float(s.x), Float(c.x))
    }
}
