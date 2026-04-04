//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKRect {
    @inlinable init(_ rect: CGRect) where Float: BinaryFloatingPoint {
        self.init(origin: .init(rect.origin), size: .init(rect.size))
    }
}

public extension CGRect {
    @inlinable init<F: BinaryFloatingPoint>(_ rect: MKRect<F>) {
        self.init(origin: .init(rect.origin), size: .init(rect.size))
    }
}
