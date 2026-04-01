//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation

public struct MKAffineTransformComponents<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    @inlinable
    public init(scale: MKSize<Float> = .init(width: 1, height: 1), rotation: MKAngle<Float> = .zero, translation: MKVector<Float> = .zero) {
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
    func decomposed() -> MKAffineTransformComponents<Float> where Float == Double {
        let scale: MKSize<Float> = .init(width: (m11 * m11 + m21 * m21).squareRoot(),
                                         height: (m12 * m12 + m22 * m22).squareRoot())

        var tr = appended(.scale(x: 1 / scale.width, y: 1 / scale.height))

        let a = Swift.Float(tr.m11)
        let b = Swift.Float(tr.m12)
        let radians = Float(atan2(b, a))
        let rotation: MKAngle<Float> = .init(radians: radians)

        tr = tr.appended(.rotation(-rotation))

        let translation: MKVector<Float> = .init(dx: tr.tx, dy: tr.ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }

    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> where Float == Swift.Float {
        let scale: MKSize<Float> = .init(width: (m11 * m11 + m21 * m21).squareRoot(),
                                         height: (m12 * m12 + m22 * m22).squareRoot())

        var tr = appended(.scale(x: 1 / scale.width, y: 1 / scale.height))
        let a = tr.m11
        let b = tr.m12
        let radians = atan2(b, a)
        let rotation: MKAngle<Float> = .init(radians: radians)

        tr = tr.appended(.rotation(-rotation))

        let translation: MKVector<Float> = .init(dx: tr.tx, dy: tr.ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }

    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> where Float == CGFloat {
        let scale: MKSize<Float> = .init(width: (m11 * m11 + m21 * m21).squareRoot(),
                                         height: (m12 * m12 + m22 * m22).squareRoot())

        var tr = appended(.scale(x: 1 / scale.width, y: 1 / scale.height))

        let a = Swift.Float(tr.m11)
        let b = Swift.Float(tr.m12)
        let radians = Float(atan2(b, a))
        let rotation: MKAngle<Float> = .init(radians: radians)

        tr = tr.appended(.rotation(-rotation))

        let translation: MKVector<Float> = .init(dx: tr.tx, dy: tr.ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }

    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> where Float == Float16 {
        let scale: MKSize<Float> = .init(width: (m11 * m11 + m21 * m21).squareRoot(),
                                         height: (m12 * m12 + m22 * m22).squareRoot())

        var tr = appended(.scale(x: 1 / scale.width, y: 1 / scale.height))

        let a = Swift.Float(tr.m11)
        let b = Swift.Float(tr.m12)
        let radians = Float(atan2(b, a))
        let rotation: MKAngle<Float> = .init(radians: radians)

        tr = tr.appended(.rotation(-rotation))

        let translation: MKVector<Float> = .init(dx: tr.tx, dy: tr.ty)

        return .init(scale: scale, rotation: rotation, translation: translation)
    }
}
