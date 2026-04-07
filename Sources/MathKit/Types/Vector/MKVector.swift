//
//  Created by Vitali Kurlovich on 10.01.26.
//

public struct MKVector<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var dx: Float
    public var dy: Float

    @inlinable public init(dx: Float, dy: Float) {
        self.dx = dx
        self.dy = dy
    }
}

public extension MKVector {
    @inlinable init() {
        self.init(dx: 0, dy: 0)
    }

    @inlinable static var zero: Self {
        .init()
    }

    @inlinable static var identity: Self {
        .init(dx: 1, dy: 1)
    }
}
