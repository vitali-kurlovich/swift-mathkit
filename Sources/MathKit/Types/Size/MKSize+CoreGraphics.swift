//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKSize {
    @inlinable init(_ size: CGSize) where Float: BinaryFloatingPoint {
        self.init(width: Float(size.width), height: Float(size.height))
    }
}

public extension CGSize {
    @inlinable init<F: BinaryFloatingPoint>(_ size: MKSize<F>) {
        self.init(width: CGFloat(size.width), height: CGFloat(size.height))
    }
}
