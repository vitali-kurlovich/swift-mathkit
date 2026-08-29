//
//  Created by Kurlovich Vitali on 8/28/26.
//

public struct MKHorizontalLine<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var y: Float

    @inlinable
    public init(y: Float) {
        self.y = y
    }
}

extension MKHorizontalLine: Line2D {
    @inlinable
    public var pivot: MKPoint<Float> {
        .init(x: 0, y: y)
    }

    @inlinable
    public var direction: MKVector<Float> {
        .init(dx: 1, dy: 0)
    }
}
