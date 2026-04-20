//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation

public extension MKRect {
    init(_ rect: CGRect) where Float: BinaryFloatingPoint {
        if rect.isInfinite {
            self = .infinite
        } else if rect.isNull {
            self = .null
        } else {
            self.init(origin: .init(rect.origin), size: .init(rect.size))
        }
    }
}

public extension CGRect {
    init<F: BinaryFloatingPoint>(_ rect: MKRect<F>) {
        if rect.isInfinite {
            self = .infinite
        } else if rect.isNull {
            self = .null
        } else {
            self.init(origin: .init(rect.origin), size: .init(rect.size))
        }
    }
}
