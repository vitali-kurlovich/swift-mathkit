//
//  Created by Vitali Kurlovich on 09.04.2026.
//

public extension MKRect {
    @inlinable
    func offsetBy(_ offset: MKVector<Float>) -> MKRect<Float> {
        return offsetBy(dx: offset.dx, dy: offset.dy)
    }

    @inlinable
    func offsetBy(dx: Float, dy: Float) -> MKRect<Float> {
        if isNull {
            return .null
        }

        if isInfinite {
            return .infinite
        }

        if dx == 0 && dy == 0 {
            return self
        }

        var rect = self
        rect.origin.x += dx
        rect.origin.y += dy
        return rect
    }
}
