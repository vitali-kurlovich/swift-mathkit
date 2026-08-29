//
//  Created by Kurlovich Vitali on 8/28/26.
//

public struct MKVerticalLine<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var x: Float

    @inlinable
    public init(x: Float) {
        self.x = x
    }
}

extension MKVerticalLine: Line2D {
    @inlinable
    public var pivot: MKPoint<Float> {
        .init(x: x, y: 0)
    }

    @inlinable
    public var direction: MKVector<Float> {
        .init(dx: 0, dy: 1)
    }
}
