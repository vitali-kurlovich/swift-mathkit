//
//  Created by Vitali Kurlovich on 09.04.2026.
//

public extension MKRect {
    @inlinable
    func offsetBy(_ offset: MKVector<Float>) -> Self {
        return offsetBy(dx: offset.dx, dy: offset.dy)
    }

    @inlinable
    func offsetBy(dx: Float, dy: Float) -> Self {
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
    func inset(by insets: MKEdgeInsets<Float>) -> Self? {
        let minX = self.minX + insets.left
        let maxX = self.maxX - insets.right

        let minY = self.minY + insets.top
        let maxY = self.maxY - insets.bottom

        let width = maxX - minX
        let height = maxY - minY

        guard width >= 0, height >= 0 else { return nil }

        return .init(x: minX, y: minY, width: width, height: height)
    }

    func insetBy(dx: Float, dy: Float) -> Self? {
        inset(by: MKEdgeInsets(top: dy, left: dx, bottom: dy, right: dx))
    }
}
