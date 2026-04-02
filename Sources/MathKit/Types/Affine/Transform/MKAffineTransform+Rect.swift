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
            return transformAspectFit(from: src, to: target)
        case .aspectFill:
            return transformAspectFill(from: src, to: target)
        case .center:
            return transformCenter(from: src, to: target)
        case .top:
            return transformTop(from: src, to: target)
        case .bottom:
            return transformBottom(from: src, to: target)
        case .left:
            return transformLeft(from: src, to: target)
        case .right:
            return transformRight(from: src, to: target)
        case .topLeft:
            return transformTopLeft(from: src, to: target)
        case .topRight:
            return transformTopRight(from: src, to: target)
        case .bottomLeft:
            return transformBottomLeft(from: src, to: target)
        case .bottomRight:
            return transformBottomRight(from: src, to: target)
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
}

extension MKAffineTransform {
    @inlinable static func transformAspectFit(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let aspectRatio = src.size.aspectRatio

        let size: MKSize<Float>

        if target.width <= target.height * aspectRatio {
            size = .init(width: target.width,
                         height: target.width / aspectRatio)
        } else {
            size = .init(width: target.height * aspectRatio,
                         height: target.height)
        }

        let dest = MKRect(origin: target.center - size / 2, size: size)

        return transformFill(from: src, to: dest)
    }

    @inlinable static func transformAspectFill(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let aspectRatio = src.size.aspectRatio

        let size: MKSize<Float>

        if target.width >= target.height * aspectRatio {
            size = .init(width: target.width,
                         height: target.width / aspectRatio)

        } else {
            size = .init(width: target.height * aspectRatio,
                         height: target.height)
        }

        let dest = MKRect(origin: target.center - size / 2, size: size)

        return transformFill(from: src, to: dest)
    }
    //
}

extension MKAffineTransform {
    @inlinable static func transformTop(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.top - src.top
        return .translation(offset)
    }

    @inlinable static func transformCenter(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.center - src.center
        return .translation(offset)
    }

    @inlinable static func transformBottom(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.bottom - src.bottom
        return .translation(offset)
    }
}

extension MKAffineTransform {
    @inlinable static func transformTopLeft(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.topLeft - src.topLeft
        return .translation(offset)
    }

    @inlinable static func transformLeft(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.left - src.left
        return .translation(offset)
    }

    @inlinable static func transformBottomLeft(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.bottomLeft - src.bottomLeft
        return .translation(offset)
    }
}

extension MKAffineTransform {
    @inlinable static func transformTopRight(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.topRight - src.topRight
        return .translation(offset)
    }

    @inlinable static func transformRight(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.right - src.right
        return .translation(offset)
    }

    @inlinable static func transformBottomRight(from src: MKRect<Float>, to target: MKRect<Float>) -> Self {
        let offset = target.bottomRight - src.bottomRight
        return .translation(offset)
    }
}
