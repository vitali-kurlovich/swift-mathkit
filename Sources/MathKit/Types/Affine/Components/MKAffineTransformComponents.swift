//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation

public struct MKAffineTransformComponents<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    @inlinable
    public init(scale: MKSize<Float> = .identity, rotation: MKAngle<Float> = .zero, translation: MKVector<Float> = .zero) {
        self.scale = scale
        self.rotation = rotation
        self.translation = translation
    }

    public var scale: MKSize<Float>
    public var rotation: MKAngle<Float>
    public var translation: MKVector<Float>
}

public extension MKAffineTransform {
    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) where Float == Double {
        self.init(scale: components.scale, rotation: components.rotation, translation: components.translation)
    }

    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) where Float == Swift.Float {
        self.init(scale: components.scale, rotation: components.rotation, translation: components.translation)
    }

    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) where Float == CGFloat {
        self.init(scale: components.scale, rotation: components.rotation, translation: components.translation)
    }

    @inlinable
    init(_ components: MKAffineTransformComponents<Float>) where Float == Float16 {
        self.init(scale: components.scale, rotation: components.rotation, translation: components.translation)
    }
}

public extension MKAffineTransform {
    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> where Float == Double {
        let radians = atan2(m12, m11)
        let rotation = MKAngle(radians: radians)

        let scale = MKSize(width: (m11 * m11 + m12 * m12).squareRoot(),
                           height: (m21 * m21 + m22 * m22).squareRoot())

        let translation = MKVector(dx: tx, dy: ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }

    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> where Float == Swift.Float {
        let radians = atan2f(m12, m11)
        let rotation = MKAngle(radians: radians)

        let scale = MKSize(width: (m11 * m11 + m12 * m12).squareRoot(),
                           height: (m21 * m21 + m22 * m22).squareRoot())

        let translation = MKVector(dx: tx, dy: ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }

    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> where Float == CGFloat {
        let radians = Float(atan2(Double(m12), Double(m11)))
        let rotation = MKAngle(radians: radians)

        let scale = MKSize(width: (m11 * m11 + m12 * m12).squareRoot(),
                           height: (m21 * m21 + m22 * m22).squareRoot())

        let translation = MKVector(dx: tx, dy: ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }

    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> where Float == Float16 {
        let radians = atan2f(Swift.Float(m12), Swift.Float(m11))
        let rotation = MKAngle(radians: Float(radians))

        let scale = MKSize(width: (m11 * m11 + m12 * m12).squareRoot(),
                           height: (m21 * m21 + m22 * m22).squareRoot())

        let translation = MKVector(dx: tx, dy: ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }
}
