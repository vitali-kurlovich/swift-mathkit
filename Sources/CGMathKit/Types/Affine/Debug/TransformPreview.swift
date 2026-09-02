//
//  Created by Kurlovich Vitali on 8/31/26.
//

import MathKit
import SwiftUI

struct TransformPreview: View {
    let label: String
    let src: CGRect
    let dst: CGRect
    let transform: (
        CGRect,
        CGRect
    ) -> CGAffineTransform

    init(
        label: String = "",
        src: CGRect,
        dst: CGRect,
        transform: @escaping (
            CGRect,
            CGRect
        ) -> CGAffineTransform
    ) {
        self.label = label
        self.src = src
        self.dst = dst
        self.transform = transform
    }

    var body: some View {
        CoordinateSystemView(label: label, drawables)
    }

    var drawables: [any Drawable] {
        [
            DrawableRect(dst, color: .blue),

            DrawableRect(src.applying(transform(src, dst)), color: .green),
        ]
    }
}
