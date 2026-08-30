//
//  Created by Kurlovich Vitali on 8/28/26.
//

public protocol Line2D {
    associatedtype Float: FloatingPoint & Sendable

    var pivot: MKPoint<Float> { get }
    var direction: MKVector<Float> { get }

    func point(at t: Float) -> MKPoint<Float>

    func intersection<L: Line2D>(_ other: L) -> MKPoint<Self.Float>? where L.Float == Self.Float
}

public extension Line2D {
    @inlinable
    func point(at t: Float) -> MKPoint<Float> {
        pivot + direction * t
    }
}

public extension Line2D {
    @inlinable
    func intersection<L: Line2D>(_ other: L) -> MKPoint<Self.Float>? where L.Float == Self.Float {
        let D = direction.cross(other.direction)

        guard D != .zero else {
            return nil
        }

        let t = ((other.pivot.x - pivot.x) * other.direction.dy - (other.pivot.y - pivot.y) * other.direction.dx) / D

        return point(at: t)
    }
}

public extension MKAffineTransform {
    /// Apply transform to the line
    @inlinable func transform<Line: Line2D>(_ line: Line) -> MKLine<Float> where Line.Float == Float {
        .init(pivot: transform(line.pivot), direction: transform(line.direction))
    }
}

public extension Line2D {
    @inlinable func applying(_ t: MKAffineTransform<Float>) -> MKLine<Float> {
        t.transform(self)
    }
}
