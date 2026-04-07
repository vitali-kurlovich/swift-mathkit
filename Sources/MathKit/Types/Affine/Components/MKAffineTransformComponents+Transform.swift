//
//  Created by Vitali Kurlovich on 07.04.2026.
//

import Foundation

public extension MKAffineTransformComponents where Float == Double {
    @inlinable
    func transform(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let tx = translation.dx
        let ty = translation.dy

        let scaleX = scale.width
        let scaleY = scale.height

        if rotation == .zero {
            if scale == .identity {
                return point + translation
            } else {
                return .init(x: tx.addingProduct(scaleX, point.x),
                             y: ty.addingProduct(scaleY, point.y))
            }

        } else {
            let (s, c) = rotation.sincos

            return .init(x: tx.addingProduct(c * scaleX, point.x).addingProduct(-s * scaleY, point.y),
                         y: ty.addingProduct(s * scaleX, point.x).addingProduct(c * scaleY, point.y))
        }
    }
}

public extension MKAffineTransformComponents where Float == CGFloat {
    @inlinable
    func transform(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let tx = translation.dx
        let ty = translation.dy

        let scaleX = scale.width
        let scaleY = scale.height

        if rotation == .zero {
            if scale == .identity {
                return point + translation
            } else {
                return .init(x: tx.addingProduct(scaleX, point.x),
                             y: ty.addingProduct(scaleY, point.y))
            }

        } else {
            let (s, c) = rotation.sincos

            return .init(x: tx.addingProduct(c * scaleX, point.x).addingProduct(-s * scaleY, point.y),
                         y: ty.addingProduct(s * scaleX, point.x).addingProduct(c * scaleY, point.y))
        }
    }
}

public extension MKAffineTransformComponents where Float == Swift.Float {
    @inlinable
    func transform(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let tx = translation.dx
        let ty = translation.dy

        let scaleX = scale.width
        let scaleY = scale.height

        if rotation == .zero {
            if scale == .identity {
                return point + translation
            } else {
                return .init(x: tx.addingProduct(scaleX, point.x),
                             y: ty.addingProduct(scaleY, point.y))
            }

        } else {
            let (s, c) = rotation.sincos

            return .init(x: tx.addingProduct(c * scaleX, point.x).addingProduct(-s * scaleY, point.y),
                         y: ty.addingProduct(s * scaleX, point.x).addingProduct(c * scaleY, point.y))
        }
    }
}

public extension MKAffineTransformComponents where Float == Float16 {
    @inlinable
    func transform(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let tx = translation.dx
        let ty = translation.dy

        let scaleX = scale.width
        let scaleY = scale.height

        if rotation == .zero {
            if scale == .identity {
                return point + translation
            } else {
                return .init(x: tx.addingProduct(scaleX, point.x),
                             y: ty.addingProduct(scaleY, point.y))
            }

        } else {
            let (s, c) = rotation.sincos

            return .init(x: tx.addingProduct(c * scaleX, point.x).addingProduct(-s * scaleY, point.y),
                         y: ty.addingProduct(s * scaleX, point.x).addingProduct(c * scaleY, point.y))
        }
    }
}

public extension MKPoint {
    @inlinable func applying(_ t: MKAffineTransformComponents<Float>) -> Self where Float == Double {
        t.transform(self)
    }

    @inlinable func applying(_ t: MKAffineTransformComponents<Float>) -> Self where Float == CGFloat {
        t.transform(self)
    }

    @inlinable func applying(_ t: MKAffineTransformComponents<Float>) -> Self where Float == Swift.Float {
        t.transform(self)
    }

    @inlinable func applying(_ t: MKAffineTransformComponents<Float>) -> Self where Float == Float16 {
        t.transform(self)
    }
}
