//
//  Created by Vitali Kurlovich on 07.04.2026.
//

public extension MKAffineTransformComponents {

    func transform(_ point: MKPoint<Float>) -> MKPoint<Float> where Float == Double {
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
