//
//  Created by Kurlovich Vitali on 8/31/26.
//

#if canImport(SwiftUI)
    import SwiftUI

    struct TransformPreview: View {
        let label: String
        let src: MKRect<CGFloat>
        let dst: MKRect<CGFloat>
        let transform: (
            MKRect<CGFloat>,
            MKRect<CGFloat>
        ) -> MKAffineTransform<CGFloat>

        init(
            label: String = "",
            src: MKRect<CGFloat>,
            dst: MKRect<CGFloat>,
            transform: @escaping (
                MKRect<CGFloat>,
                MKRect<CGFloat>
            ) -> MKAffineTransform<CGFloat>
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

#endif
