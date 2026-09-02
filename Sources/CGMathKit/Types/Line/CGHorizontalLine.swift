//
//  Created by Kurlovich Vitali on 8/30/26.
//

import CoreGraphics
import MathKit

public struct CGHorizontalLine: Hashable, Sendable {
    public var y: CGFloat

    @inlinable
    public init(y: CGFloat) {
        self.y = y
    }
}

extension CGHorizontalLine: CGLine2D {
    @inlinable
    public var pivot: CGPoint {
        .init(x: 0, y: y)
    }

    @inlinable
    public var direction: CGVector {
        .init(dx: 1, dy: 0)
    }
}

public extension CGHorizontalLine {
    @inlinable
    init(_ line: MKHorizontalLine<some BinaryFloatingPoint>) {
        self.init(y: .init(line.y))
    }
}

public extension MKHorizontalLine where Float: BinaryFloatingPoint {
    @inlinable
    init(_ line: CGHorizontalLine) {
        self.init(y: .init(line.y))
    }
}
