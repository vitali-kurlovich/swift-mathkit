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
        if rotation == .zero {
            self.init(dx: magnitude, dy: 0)
        } else {
            let (s, c) = rotation.sincos
            self.init(dx: c * magnitude, dy: s * magnitude)
        }
    }

    @inlinable
    init(magnitude: Float, rotation: MKAngle<Float>) where Float == Swift.Float {
        if rotation == .zero {
            self.init(dx: magnitude, dy: 0)
        } else {
            let (s, c) = rotation.sincos
            self.init(dx: c * magnitude, dy: s * magnitude)
        }
    }

    @inlinable
    init(magnitude: Float, rotation: MKAngle<Float>) where Float == CGFloat {
        if rotation == .zero {
            self.init(dx: magnitude, dy: 0)
        } else {
            let (s, c) = rotation.sincos
            self.init(dx: c * magnitude, dy: s * magnitude)
        }
    }

    @inlinable
    init(magnitude: Float, rotation: MKAngle<Float>) where Float == Float16 {
        if rotation == .zero {
            self.init(dx: magnitude, dy: 0)
        } else {
            let (s, c) = rotation.sincos
            self.init(dx: c * magnitude, dy: s * magnitude)
        }
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

public extension MKVector {
    @inlinable
    func decomposed() -> MKVectorComponents<Float> where Float == Double {
        let radians = atan2(dy, dx)
        let rotation = MKAngle<Float>(radians: radians)
        return .init(magnitude: magnitude, rotation: rotation)
    }

    @inlinable
    func decomposed() -> MKVectorComponents<Float> where Float == Swift.Float {
        let radians = atan2f(dy, dx)
        let rotation = MKAngle<Float>(radians: radians)
        return .init(magnitude: magnitude, rotation: rotation)
    }

    @inlinable
    func decomposed() -> MKVectorComponents<Float> where Float == CGFloat {
        let radians = Float(atan2(Double(dy), Double(dx)))
        let rotation = MKAngle<Float>(radians: radians)
        return .init(magnitude: magnitude, rotation: rotation)
    }

    @inlinable
    func decomposed() -> MKVectorComponents<Float> where Float == Float16 {
        let radians = atan2f(Swift.Float(dy), Swift.Float(dx))
        let rotation = MKAngle<Float>(radians: Float(radians))
        return .init(magnitude: magnitude, rotation: rotation)
    }
}
