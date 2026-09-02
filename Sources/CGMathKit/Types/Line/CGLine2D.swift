//
//  Created by Kurlovich Vitali on 8/30/26.
//

import CoreGraphics
import MathKit

public protocol CGLine2D {
    var pivot: CGPoint { get }
    var direction: CGVector { get }

    func point(at t: CGFloat) -> CGPoint

    func intersection(_ other: some CGLine2D) -> CGPoint?
}

public extension CGLine2D {
    @inlinable
    func point(at t: CGFloat) -> CGPoint {
        .init(MKLine(self).point(at: t))
    }

    @inlinable
    func intersection(_ other: some CGLine2D) -> CGPoint? {
        if let p = MKLine<CGFloat>(self).intersection(MKLine(other)) {
            return .init(p)
        }
        return nil
    }
}

public extension MKAffineTransform {
    /// Apply transform to the line
    @inlinable func transform(_ line: some CGLine2D) -> CGLine where Float == CGFloat {
        .init(transform(MKLine<CGFloat>(line)))
    }
}

public extension CGAffineTransform {
    /// Apply transform to the line
    @inlinable func transform(_ line: some CGLine2D) -> CGLine {
        MKAffineTransform(self).transform(line)
    }
}

public extension CGLine2D {
    @inlinable func applying(_ t: MKAffineTransform<CGFloat>) -> CGLine {
        t.transform(self)
    }

    @inlinable func applying(_ t: CGAffineTransform) -> CGLine {
        t.transform(self)
    }
}
