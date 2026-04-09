//
//  Created by Vitali Kurlovich on 08.04.2026.
//

public extension MKRect {
    @inlinable
    func contains(x: Float, y: Float) -> Bool {
        if isInfinite {
            return true
        }

        if isEmpty || isNull {
            return false
        }

        return minX <= x && x <= maxX && minY <= y && y <= maxY
    }

    @inlinable
    func contains(_ point: MKPoint<Float>) -> Bool {
        contains(x: point.x, y: point.y)
    }
}
