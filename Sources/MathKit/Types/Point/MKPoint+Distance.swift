//
//  Created by Vitali Kurlovich on 18.01.26.
//

public extension MKPoint {
    @inlinable var magnitudeSquared: Float {
        let s = self * self
        return s.x + s.y
    }

    @inlinable var magnitude: Float {
        magnitudeSquared.squareRoot()
    }
}

public extension MKPoint {
    @inlinable func distanceSquared(to target: Self) -> Float {
        (self - target).magnitudeSquared
    }

    @inlinable func distance(to target: Self) -> Float {
        distanceSquared(to: target).squareRoot()
    }
}

@inlinable public func normalize<Float: FloatingPoint & Sendable>(_ source: MKPoint<Float>) -> MKPoint<Float> {
    source / source.magnitude
}

public extension MKPoint {
    func normalized() -> Self {
        MathKit.normalize(self)
    }

    mutating func normalize() {
        self /= magnitude
    }
}
