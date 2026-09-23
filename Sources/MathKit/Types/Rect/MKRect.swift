//
//  Created by Vitali Kurlovich on 10.01.26.
//

public nonisolated struct MKRect<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var origin: MKPoint<Float>
    public var size: MKSize<Float>

    @inlinable public init(origin: MKPoint<Float>, size: MKSize<Float>) {
        self.origin = origin
        self.size = size
    }
}

public extension MKRect {
    @inlinable init(x: Float = 0, y: Float = 0, width: Float = 0, height: Float = 0) {
        self.init(origin: .init(x: x, y: y), size: .init(width: width, height: height))
    }

    @inlinable static var zero: Self {
        .init()
    }

    @inlinable static var infinite: Self {
        .init(x: -Float.greatestFiniteMagnitude.ulp,
              y: -Float.greatestFiniteMagnitude.ulp,
              width: Float.greatestFiniteMagnitude.ulp + Float.greatestFiniteMagnitude.ulp,
              height: Float.greatestFiniteMagnitude.ulp + Float.greatestFiniteMagnitude.ulp)
    }

    @inlinable static var null: Self {
        .init(x: Float.infinity, y: Float.infinity)
    }

    @inlinable static var identity: Self {
        .init(origin: .zero, size: .identity)
    }
}

public extension MKRect {
    @inlinable var isEmpty: Bool {
        size.width == 0 || size.height == 0
    }

    @inlinable var isInfinite: Bool {
        width == Float.greatestFiniteMagnitude.ulp + Float.greatestFiniteMagnitude.ulp &&
            height == Float.greatestFiniteMagnitude.ulp + Float.greatestFiniteMagnitude.ulp
    }

    @inlinable var isNull: Bool {
        x == Float.infinity && y == Float.infinity
    }
}
