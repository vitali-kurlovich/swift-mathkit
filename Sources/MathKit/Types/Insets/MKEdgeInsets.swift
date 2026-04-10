//
//  Created by Vitali Kurlovich on 10.04.2026.
//

public struct MKEdgeInsets<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var top: Float
    public var left: Float
    public var bottom: Float
    public var right: Float

    public init(top: Float = 0, left: Float = 0, bottom: Float = 0, right: Float = 0) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

public extension MKEdgeInsets {
    static var zero: Self { .init() }
}
