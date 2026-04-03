//
//  Created by Vitali Kurlovich on 03.04.2026.
//

import Foundation

public struct MKVectorComponents<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var magnitude: Float
    public var rotation: MKAngle<Float>

    @inlinable
    public init(magnitude: Float, rotation: MKAngle<Float>) {
        assert(magnitude >= 0)

        self.magnitude = magnitude
        self.rotation = rotation
    }
}

public extension MKVector {
    @inlinable
    init(magnitude: Float, rotation: MKAngle<Float>) where Float == Double {
        let (s, c) = rotation.sincos

        self.init(dx: c * magnitude, dy: s * magnitude)
    }

    @inlinable
    init(magnitude: Float, rotation: MKAngle<Float>) where Float == Swift.Float {
        let (s, c) = rotation.sincos

        self.init(dx: c * magnitude, dy: s * magnitude)
    }

    @inlinable
    init(magnitude: Float, rotation: MKAngle<Float>) where Float == CGFloat {
        let (s, c) = rotation.sincos

        self.init(dx: c * magnitude, dy: s * magnitude)
    }

    @inlinable
    init(magnitude: Float, rotation: MKAngle<Float>) where Float == Float16 {
        let (s, c) = rotation.sincos

        self.init(dx: c * magnitude, dy: s * magnitude)
    }
}

public extension MKVector {
    @inlinable
    init(_ components: MKVectorComponents<Float>) where Float == Double {
        self.init(magnitude: components.magnitude, rotation: components.rotation)
    }

    @inlinable
    init(_ components: MKVectorComponents<Float>) where Float == Swift.Float {
        self.init(magnitude: components.magnitude, rotation: components.rotation)
    }

    @inlinable
    init(_ components: MKVectorComponents<Float>) where Float == CGFloat {
        self.init(magnitude: components.magnitude, rotation: components.rotation)
    }

    @inlinable
    init(_ components: MKVectorComponents<Float>) where Float == Float16 {
        self.init(magnitude: components.magnitude, rotation: components.rotation)
    }
}
