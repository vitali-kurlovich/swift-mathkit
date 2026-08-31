//
//  Created by Kurlovich Vitali on 8/31/26.
//

#if canImport(SwiftUI)
    import Foundation
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
            CoordinateSystemView(label: label, drawables).onAppear {
                let exp = src.applying(transform(src, dst))

                let source = """
                (
                MKRect<Double>(x: \(src.x), y: \(src.y), width: \(src.width), height: \(src.height)),
                MKRect<Double>(x: \(dst.x), y: \(dst.y), width: \(dst.width), height: \(dst.height)),
                MKRect<Double>(x: \(exp.x), y: \(exp.y), width: \(exp.width), height: \(exp.height)),
                ),
                """

                print(source)
            }
        }

        var drawables: [any Drawable] {
            [
                DrawableRect(dst, color: .blue),

                DrawableRect(src.applying(transform(src, dst)), color: .green),
            ]
        }
    }

#endif
