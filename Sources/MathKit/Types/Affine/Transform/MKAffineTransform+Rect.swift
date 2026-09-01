//
//  Created by Vitali Kurlovich on 02.04.2026.
//

public extension MKAffineTransform {
    @inlinable static func transform(for src: MKRect<Float>, center dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.center - src.center
        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, top dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.top - src.top

        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, bottom dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.bottom - src.bottom

        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, left dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.left - src.left

        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, topLeft dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.topLeft - src.topLeft

        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, bottomLeft dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.bottomLeft - src.bottomLeft

        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, right dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.right - src.right

        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, topRight dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.topRight - src.topRight

        return .init(translationX: offset.x, y: offset.y)
    }

    @inlinable static func transform(for src: MKRect<Float>, bottomRight dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        let offset = dst.bottomRight - src.bottomRight

        return .init(translationX: offset.x, y: offset.y)
    }
}

public extension MKAffineTransform {
    @inlinable static func transform(for src: MKRect<Float>, fill dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        assert(src.width != 0)
        assert(src.height != 0)

        let scaleX = dst.width / src.width
        let scaleY = dst.height / src.height

        let scaleTransform = Self(scaleX: scaleX, y: scaleY)
        let src = src.applying(scaleTransform)

        let offsetTransform = Self.transform(for: src, center: dst)

        return scaleTransform.concatenating(offsetTransform)
    }
}

public extension MKAffineTransform {
    @inlinable static func transform(for src: MKRect<Float>, aspectFit dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        assert(src.width != 0)
        assert(src.height != 0)

        let scale = src.height * dst.width <= dst.height * src.width ?
            dst.width / src.width :
            dst.height / src.height

        let scaleTransform = Self(scale: scale)
        let src = src.applying(scaleTransform)

        let offsetTransform = Self.transform(for: src, center: dst)

        return scaleTransform.concatenating(offsetTransform)
    }

    @inlinable static func transform(for src: MKRect<Float>, aspectFill dst: MKRect<Float>) -> Self {
        if dst == src {
            return .identity
        }

        assert(src.width != 0)
        assert(src.height != 0)

        let scale = src.height * dst.width <= dst.height * src.width ?
            dst.height / src.height :
            dst.width / src.width

        let scaleTransform = Self(scale: scale)
        let src = src.applying(scaleTransform)

        let offsetTransform = Self.transform(for: src, center: dst)

        return scaleTransform.concatenating(offsetTransform)
    }
}
