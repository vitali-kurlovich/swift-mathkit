//
//  Created by Vitali Kurlovich on 09.04.2026.
//

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

public extension MKRect {
    @inlinable
    func intersects(_ other: Self) -> Bool {
        if isNull || other.isNull {
            return false
        }

        if isInfinite || other.isInfinite {
            return true
        }

        let minX: Float = self.minX <= other.minX ? other.minX : self.minX
        let maxX: Float = min(self.maxX, other.maxX)

        let minY: Float = self.minY <= other.minY ? other.minY : self.minY
        let maxY: Float = min(self.maxY, other.maxY)

        return maxX >= minX && maxY >= minY
    }

    @inlinable
    func intersection(_ other: Self) -> Self? {
        if isNull || other.isNull {
            return nil
        }

        if isInfinite {
            return other
        }

        if other.isInfinite {
            return self
        }

        let minX: Float = self.minX <= other.minX ? other.minX : self.minX
        let maxX: Float = min(self.maxX, other.maxX)

        guard maxX >= minX else {
            return nil
        }

        let minY: Float = self.minY <= other.minY ? other.minY : self.minY
        let maxY: Float = min(self.maxY, other.maxY)

        guard maxY >= minY else {
            return nil
        }

        return .init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
