//
//  Created by Kurlovich Vitali on 8/28/26.
//

public struct MKLine<Float: FloatingPoint & Sendable>: Line2D, Hashable, Sendable {
    public var pivot: MKPoint<Float>
    public var direction: MKVector<Float> {
        didSet {
            assert(direction != .zero)
        }
    }

    @inlinable
    public init(
        pivot: MKPoint<Float>,
        direction: MKVector<Float>
    ) {
        assert(direction != .zero)
        self.pivot = pivot
        self.direction = direction
    }
}

public extension MKLine {
    @inlinable
    init<L: Line2D>(_ line: L) where L.Float == Self.Float {
        self.init(
            pivot: line.pivot,
            direction: line.direction
        )
    }
}
