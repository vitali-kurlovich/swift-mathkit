//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKPoint {
    @inlinable init(_ p: CGPoint) where Float: BinaryFloatingPoint {
        self.init(x: Float(p.x), y: Float(p.y))
    }
}

public extension CGPoint {
    @inlinable init<F: BinaryFloatingPoint>(_ p: MKPoint<F>) {
        self.init(x: CGFloat(p.x), y: CGFloat(p.y))
    }
}
