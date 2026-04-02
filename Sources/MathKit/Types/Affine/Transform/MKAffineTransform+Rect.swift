//
//  Created by Vitali Kurlovich on 02.04.2026.
//

public enum ScaleMode {
    case fill
    case aspectFit
    case aspectFill
    case center
    case top
    case bottom
    case left
    case right
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

public extension MKAffineTransform {
    @inlinable static func transform(from src: MKRect<Float>, to target: MKRect<Float>, scaleMode: ScaleMode = .fill) -> Self {
        assert(src.width > 0)
        assert(src.height > 0)

        switch scaleMode {
        case .fill:
            return transformFill(from: src, to: target)
        case .aspectFit:
            fatalError("Not implemented")
        case .aspectFill:
            fatalError("Not implemented")
        case .center:
            return transformCenter(from: src, to: target)
        case .top:
            fatalError("Not implemented")
        case .bottom:
            fatalError("Not implemented")
        case .left:
            fatalError("Not implemented")
        case .right:
            fatalError("Not implemented")
        case .topLeft:
            fatalError("Not implemented")
        case .topRight:
            fatalError("Not implemented")
        case .bottomLeft:
            fatalError("Not implemented")
        case .bottomRight:
            fatalError("Not implemented")
        }
    }
}

extension MKAffineTransform {
    @inlinable static func transformFill(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let scaleX = target.width / src.width
        let scaleY = target.height / src.height

        return .init(m11: scaleX, m12: 0,
                     m21: 0, m22: scaleY,
                     tx: target.origin.x - scaleX * src.origin.x,
                     ty: target.origin.y - scaleY * src.origin.y)
    }

    @inlinable static func transformCenter(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.center - src.center
        return .translation(offset)
    }
}
