//
//  Created by Kurlovich Vitali on 8/28/26.
//

public struct MKSegment<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var point1: MKPoint<Float>
    public var point2: MKPoint<Float>

    public init(
        point1: MKPoint<Float>,
        point2: MKPoint<Float>
    ) {
        self.point1 = point1
        self.point2 = point2
    }
}

public extension MKLine {
    init(_ segment: MKSegment<Float>) {
        self.init(pivot: segment.point1, direction: .init(segment.point2 - segment.point1))
    }
}

public extension MKSegment {
    func intersection<L: Line2D>(_ other: L) -> MKPoint<Float>? where L.Float == Float {
        let direction = MKVector(point2 - point1)
        let pivot = point1

        let D = direction.cross(other.direction)

        guard D != .zero else {
            return nil
        }

        let t = ((other.pivot.x - pivot.x) * other.direction.dy - (other.pivot.y - pivot.y) * other.direction.dx) / D

        func point(at t: Float) -> MKPoint<Float> {
            pivot + direction * t
        }

        if t >= Float(0), t <= Float(1) {
            return point(at: t)
        }

        return nil
    }
}

public extension Line2D {
    func intersection(_ segment: MKSegment<Float>) -> MKPoint<Self.Float>? {
        segment.intersection(self)
    }
}

public extension Line2D {
    func intersection(_ rect: MKRect<Float>) -> MKSegment<Float>? {
        let minX = rect.minX
        let minY = rect.minY

        let maxX = rect.maxX
        let maxY = rect.maxY

        let leftTop = MKPoint(x: minX, y: minY)
        let rightTop = MKPoint(x: maxX, y: minY)

        let leftBottom = MKPoint(x: minX, y: maxY)
        let rightBottom = MKPoint(x: maxX, y: maxY)

        var points: [MKPoint<Float>] = []
        points.reserveCapacity(2)

        if let p = intersection(MKSegment(point1: leftTop, point2: rightTop)) {
            points.append(p)
        }

        if let p = intersection(MKSegment(point1: rightTop, point2: rightBottom)) {
            points.append(p)
        }

        if let p = intersection(MKSegment(point1: rightBottom, point2: leftBottom)) {
            points.append(p)
        }

        if let p = intersection(MKSegment(point1: leftBottom, point2: leftTop)) {
            points.append(p)
        }

        guard points.count > 1 else { return nil }

        return .init(point1: points[0], point2: points[1])
    }
}
