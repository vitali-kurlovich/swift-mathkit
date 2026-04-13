//
//  Created by Vitali Kurlovich on 03.04.2026.
//

public extension MKVector {
    @inlinable var magnitudeSquared: Float {
        dx * dx + dy * dy
    }

    @inlinable var magnitude: Float {
        magnitudeSquared.squareRoot()
    }
}

@inlinable public func normalize<Float: FloatingPoint & Sendable>(_ source: MKVector<Float>) -> MKVector<Float> {
    source / source.magnitude
}

public extension MKVector {
    @inlinable
    func normalized() -> Self {
        MathKit.normalize(self)
    }

    @inlinable
    mutating func normalize() {
        self /= magnitude
    }
}
