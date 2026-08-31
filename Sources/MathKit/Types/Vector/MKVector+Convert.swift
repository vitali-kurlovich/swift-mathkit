//
//  Created by Kurlovich Vitali on 8/30/26.
//

public extension MKVector where Float: BinaryFloatingPoint {
    @inlinable init(_ v: MKVector<some BinaryFloatingPoint & Sendable>) {
        self.init(dx: .init(v.dx), dy: .init(v.dy))
    }
}
