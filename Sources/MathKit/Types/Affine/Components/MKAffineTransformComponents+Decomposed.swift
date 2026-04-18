//
//  Created by Vitali Kurlovich on 07.04.2026.
//

import Foundation

public extension MKAffineTransform where Float: BinaryFloatingPoint {
    @inlinable
    func decomposed() -> MKAffineTransformComponents<Float> {
        .init(translation: translation, rotation: rotation, scale: scale)
    }
}

extension MKAffineTransform where Float: BinaryFloatingPoint {
    @inlinable
    var rotation: MKAngle<Float> {
        if Float.self == Swift.Float.self || Float.self == Float16.self {
            let radians = atan2f(Swift.Float(m12), Swift.Float(m11))

            return .init(radians: .init(radians))
        }

        let radians = atan2(Double(m12), Double(m11))

        return .init(radians: .init(radians))
    }

    @inlinable
    var scale: MKSize<Float> {
        MKSize(
            width: (m11 * m11).addingProduct(m12, m12).squareRoot(),
            height: (m21 * m21).addingProduct(m22, m22).squareRoot()
        )
    }

    @inlinable
    var translation: MKVector<Float> {
        MKVector(dx: tx, dy: ty)
    }
}
