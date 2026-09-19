//
//  Created by Kurlovich Vitali on 9/19/26.
//

import CoreGraphics
import MathKit

public extension CGRect {
    @inlinable
    func divide(by line: CGVerticalLine) -> (Self, Self) {
        let (first, second) = MKRect<CGFloat>(self).divide(by: MKVerticalLine(line))
        return (.init(first), .init(second))
    }

    @inlinable
    func divide(by line: CGHorizontalLine) -> (Self, Self) {
        let (first, second) = MKRect<CGFloat>(self).divide(by: MKHorizontalLine(line))
        return (.init(first), .init(second))
    }
}
