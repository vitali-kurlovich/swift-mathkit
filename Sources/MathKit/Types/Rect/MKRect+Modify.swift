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

public extension MKRect {
    @inlinable
    func union(_ other: MKRect<Float>) -> MKRect<Float> {
        if isInfinite || other.isInfinite {
            return .infinite
        }

        if isNull {
            return other
        }

        if other.isNull {
            return self
        }

        let minX = min(self.minX, other.minX)
        let minY = min(self.minY, other.minY)

        let maxX = max(self.maxX, other.maxX)
        let maxY = max(self.maxY, other.maxY)

        return MKRect<Float>(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
