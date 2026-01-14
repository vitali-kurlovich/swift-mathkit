//
//  MKAngle+sincos.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 12.01.26.
//

import Foundation

#if canImport(simd)
    import simd

    public extension MKAngle where Float == Double {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let simdAngle = SIMD2<Double>(radians, radians)
            let (s, c) = simd.sincos(simdAngle)
            return (s.x, c.x)
        }
    }

    public extension MKAngle where Float == Swift.Float {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let simdAngle = SIMD2(radians, radians)
            let (s, c) = simd.sincos(simdAngle)
            return (s.x, c.x)
        }
    }

    public extension MKAngle where Float == Float16 {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let simdAngle = SIMD2(Swift.Float(radians), Swift.Float(radians))
            let (s, c) = simd.sincos(simdAngle)
            return (Float(s.x), Float(c.x))
        }
    }

    public extension MKAngle where Float == CGFloat {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let simdAngle = SIMD2(Double(radians), Double(radians))
            let (s, c) = simd.sincos(simdAngle)
            return (Float(s.x), Float(c.x))
        }
    }

#else

    public extension MKAngle where Float == Double {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let s = sin(radians)
            let c = cos(radians)

            return (s, c)
        }
    }

    public extension MKAngle where Float == Swift.Float {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let s = sin(radians)
            let c = cos(radians)

            return (s, c)
        }
    }

    public extension MKAngle where Float == Float16 {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let s = sin(Float32(radians))
            let c = cos(Float32(radians))

            return (Float(s), Float(c))
        }
    }

    public extension MKAngle where Float == CGFloat {
        @inlinable var sincos: (Float, Float) {
            if radians == 0 {
                return (0, 1)
            }

            let s = sin(radians)
            let c = cos(radians)

            return (s, c)
        }
    }

#endif
