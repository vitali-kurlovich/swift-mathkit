//
//  Created by Vitali Kurlovich on 03.04.2026.
//

import Foundation

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
public extension MKVector where Float == Double {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        if angle != .zero {
            let (s, c) = angle.sincos
            let _dx = dx

            dx *= c
            dx.addProduct(dy, -s)

            dy *= c
            dy.addProduct(_dx, s)
        }
    }

    @inlinable
    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
public extension MKVector where Float == Swift.Float {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        if angle != .zero {
            let (s, c) = angle.sincos
            let _dx = dx

            dx *= c
            dx.addProduct(dy, -s)

            dy *= c
            dy.addProduct(_dx, s)
        }
    }

    @inlinable
    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
public extension MKVector where Float == CGFloat {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        if angle != .zero {
            let (s, c) = angle.sincos
            let _dx = dx

            dx *= c
            dx.addProduct(dy, -s)

            dy *= c
            dy.addProduct(_dx, s)
        }
    }

    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}

@available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
public extension MKVector where Float == Float16 {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        if angle != .zero {
            let (s, c) = angle.sincos
            let _dx = dx

            dx *= c
            dx.addProduct(dy, -s)

            dy *= c
            dy.addProduct(_dx, s)
        }
    }

    @inlinable
    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}
