//
//  Created by Kurlovich Vitali on 8/30/26.
//

public extension MKPoint where Float: BinaryFloatingPoint {
    @inlinable init(_ p: MKPoint<some BinaryFloatingPoint & Sendable>) {
        self.init(x: .init(p.x), y: .init(p.y))
    }
}
