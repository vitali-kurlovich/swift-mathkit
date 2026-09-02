//
//  Created by Kurlovich Vitali on 8/31/26.
//

import MathKit
import SwiftUI

enum RectTransform {
    case original
    case swapSize
    case widthOnly
    case heightOnly
}

extension CGRect {
    func transform(_ transform: RectTransform) -> Self {
        switch transform {
        case .original:
            self
        case .swapSize:
            .init(
                x: x,
                y: y,
                width: height,
                height: width
            )
        case .widthOnly:
            .init(
                x: x,
                y: y,
                width: width,
                height: width
            )
        case .heightOnly:
            .init(
                x: x,
                y: y,
                width: height,
                height: height
            )
        }
    }
}

struct TransformVariantsPreview: View {
    let label: String
    let src: CGRect
    let dst: CGRect

    let transform: (CGRect, CGRect) -> CGAffineTransform

    var body: some View {
        VStack {
            _TransformVariantsPreview(label: label, src: src, dst: dst, transform: transform)
            _TransformVariantsPreview(label: label, src: dst, dst: src, transform: transform)
        }
    }
}

private struct _TransformVariantsPreview: View {
    let label: String
    let src: CGRect
    let dst: CGRect

    let transform: (
        CGRect,
        CGRect
    ) -> CGAffineTransform

    var body: some View {
        HStack {
            TransformPreview(
                label: label,
                src: src.transform(.original),
                dst: dst.transform(.original),
                transform: transform
            )

            Spacer()
            TransformPreview(
                label: label,
                src: src.transform(.swapSize),
                dst: dst.transform(.original),
                transform: transform
            )

            Spacer()
            TransformPreview(
                label: label,
                src: src.transform(.widthOnly),
                dst: dst.transform(.original),
                transform: transform
            )
            Spacer()
            TransformPreview(
                label: label,
                src: src.transform(.heightOnly),
                dst: dst.transform(.original),
                transform: transform
            )
        }.frame(width: .infinity)
    }
}
