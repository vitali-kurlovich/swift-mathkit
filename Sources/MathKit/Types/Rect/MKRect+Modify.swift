//
//  Created by Vitali Kurlovich on 09.04.2026.
//

public extension MKRect {
    @inlinable
    func offsetBy(_ offset: MKVector<Float>) -> Self {
        offsetBy(dx: offset.dx, dy: offset.dy)
    }

    @inlinable
    func offsetBy(dx: Float, dy: Float) -> Self {
        if isNull {
            return .null
        }

        if isInfinite {
            return .infinite
        }

        if dx == 0, dy == 0 {
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
    func inset(by insets: MKEdgeInsets<Float>) -> Self? {
        let minX = minX + insets.left
        let maxX = maxX - insets.right

        let minY = minY + insets.top
        let maxY = maxY - insets.bottom

        let width = maxX - minX
        let height = maxY - minY

        guard width >= 0, height >= 0 else { return nil }

        return .init(x: minX, y: minY, width: width, height: height)
    }

    func insetBy(dx: Float, dy: Float) -> Self? {
        inset(by: MKEdgeInsets(top: dy, left: dx, bottom: dy, right: dx))
    }
}

public extension MKRect {
    @inlinable
    func divide(by line: MKVerticalLine<Float>) -> (Self, Self) {
        func first() -> Self {
            if line.x < minX {
                return .null
            }

            let maxX = min(maxX, line.x)

            return .init(
                x: minX,
                y: minY,
                width: maxX - minX,
                height: maxY - minY
            )
        }

        func second() -> Self {
            if line.x > maxX {
                return .null
            }

            let minX = max(minX, line.x)

            return .init(
                x: minX,
                y: minY,
                width: maxX - minX,
                height: maxY - minY
            )
        }

        return (first(), second())
    }

    @inlinable
    func divide(by line: MKHorizontalLine<Float>) -> (Self, Self) {
        func first() -> Self {
            if line.y < minY {
                return .null
            }

            let maxY = min(maxY, line.y)

            return .init(
                x: minX,
                y: minY,
                width: maxX - minX,
                height: maxY - minY
            )
        }

        func second() -> Self {
            if line.y > maxY {
                return .null
            }

            let minY = max(minY, line.y)

            return .init(
                x: minX,
                y: minY,
                width: maxX - minX,
                height: maxY - minY
            )
        }

        return (first(), second())
    }
}
