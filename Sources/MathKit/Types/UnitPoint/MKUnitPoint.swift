//
//  Created by Vitali Kurlovich on 06.04.2026.
//

public struct MKUnitPoint<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var x: Float
    public var y: Float

    @inlinable public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}

public extension MKUnitPoint {
    @inlinable static var zero: MKUnitPoint<Float> {
        .init(x: 0, y: 0)
    }

    @inlinable static var identity: Self {
        .init(x: 1, y: 1)
    }
}

public extension MKUnitPoint {
    @inlinable static var center: Self {
        self.init(x: 1 / 2, y: 1 / 2)
    }
}
