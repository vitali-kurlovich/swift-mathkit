//
//  Created by Kurlovich Vitali on 8/24/26.
//

import Foundation

public extension MKAffineTransform where Float: BinaryFloatingPoint {
    @inlinable static func transform(for src: CGRect, center dst: CGRect) -> Self {
        transform(for: MKRect(src), center: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, left dst: CGRect) -> Self {
        transform(for: MKRect(src), left: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, right dst: CGRect) -> Self {
        transform(for: MKRect(src), right: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, top dst: CGRect) -> Self {
        transform(for: MKRect(src), top: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, topLeft dst: CGRect) -> Self {
        transform(for: MKRect(src), topLeft: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, topRight dst: CGRect) -> Self {
        transform(for: MKRect(src), topRight: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, bottom dst: CGRect) -> Self {
        transform(for: MKRect(src), bottom: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, bottomLeft dst: CGRect) -> Self {
        transform(for: MKRect(src), bottomLeft: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, bottomRight dst: CGRect) -> Self {
        transform(for: MKRect(src), bottomRight: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, fill dst: CGRect) -> Self {
        transform(for: MKRect(src), fill: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, aspectFit dst: CGRect) -> Self {
        transform(for: MKRect(src), aspectFit: MKRect(dst))
    }

    @inlinable static func transform(for src: CGRect, aspectFill dst: CGRect) -> Self {
        transform(for: MKRect(src), aspectFill: MKRect(dst))
    }
}

public extension CGAffineTransform {
    @inlinable static func transform(for src: CGRect, center dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, center: dst))
    }

    @inlinable static func transform(for src: CGRect, left dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, left: dst))
    }

    @inlinable static func transform(for src: CGRect, right dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, right: dst))
    }

    @inlinable static func transform(for src: CGRect, top dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, top: dst))
    }

    @inlinable static func transform(for src: CGRect, topLeft dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, topLeft: dst))
    }

    @inlinable static func transform(for src: CGRect, topRight dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, topRight: dst))
    }

    @inlinable static func transform(for src: CGRect, bottom dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, bottom: dst))
    }

    @inlinable static func transform(for src: CGRect, bottomLeft dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, topLeft: dst))
    }

    @inlinable static func transform(for src: CGRect, bottomRight dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, topRight: dst))
    }

    @inlinable static func transform(for src: CGRect, fill dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, fill: dst))
    }

    @inlinable static func transform(for src: CGRect, aspectFit dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, aspectFit: dst))
    }

    @inlinable static func transform(for src: CGRect, aspectFill dst: CGRect) -> Self {
        .init(MKAffineTransform<CGFloat>.transform(for: src, aspectFill: dst))
    }
}
