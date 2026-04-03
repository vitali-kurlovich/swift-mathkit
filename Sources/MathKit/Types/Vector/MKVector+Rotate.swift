//
//  Created by Vitali Kurlovich on 03.04.2026.
//

import Foundation

public extension MKVector where Float == Double {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        let (s, c) = angle.sincos
        let _dx = dx

        dx *= c
        dx.addProduct(dy, -s)

        dy *= c
        dy.addProduct(_dx, s)
    }

    @inlinable
    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}

public extension MKVector where Float == Swift.Float {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        let (s, c) = angle.sincos
        let _dx = dx

        dx *= c
        dx.addProduct(dy, -s)

        dy *= c
        dy.addProduct(_dx, s)
    }

    @inlinable
    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}

public extension MKVector where Float == CGFloat {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        let (s, c) = angle.sincos
        let _dx = dx

        dx *= c
        dx.addProduct(dy, -s)

        dy *= c
        dy.addProduct(_dx, s)
    }

    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}

public extension MKVector where Float == Float16 {
    @inlinable
    mutating func rotate(_ angle: MKAngle<Float>) {
        let (s, c) = angle.sincos
        let _dx = dx

        dx *= c
        dx.addProduct(dy, -s)

        dy *= c
        dy.addProduct(_dx, s)
    }

    @inlinable
    func rotated(_ angle: MKAngle<Float>) -> Self {
        var v = self
        v.rotate(angle)
        return v
    }
}
