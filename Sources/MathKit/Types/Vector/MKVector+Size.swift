//
//  Created by Vitali Kurlovich on 02.04.2026.
//

public extension MKVector {
    @inlinable static func + (left: Self, size: MKSize<Float>) -> Self {
        return .init(dx: left.dx + size.width, dy: left.dy + size.height)
    }

    @inlinable static func += (left: inout Self, size: MKSize<Float>) {
        left = left + size
    }
}

public extension MKVector {
    @inlinable static func - (left: Self, size: MKSize<Float>) -> Self {
        return .init(dx: left.dx - size.width, dy: left.dy - size.height)
    }

    @inlinable static func -= (left: inout Self, size: MKSize<Float>) {
        left = left - size
    }
}
