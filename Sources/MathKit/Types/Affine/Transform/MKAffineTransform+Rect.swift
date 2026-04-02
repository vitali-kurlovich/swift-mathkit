//
//  Created by Vitali Kurlovich on 02.04.2026.
//

public extension MKAffineTransform {
    static func transform(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        assert(src.width > 0)
        assert(src.height > 0)

        let scaleX = target.width / src.width
        let scaleY = target.height / src.height

        return .init(m11: scaleX, m12: 0,
                     m21: 0, m22: scaleY,
                     tx: target.origin.x - scaleX * src.origin.x,
                     ty: target.origin.y - scaleY * src.origin.y)
    }
}
