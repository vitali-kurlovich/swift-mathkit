//
//  Created by Kurlovich Vitali on 8/25/26.
//

#if canImport(SwiftUI)

    import MathKit
    import SwiftUI

    struct DrawableRect: Drawable {
        let rect: CGRect
        let color: Color

        init(_ rect: CGRect, color: Color = .random()) {
            self.rect = rect
            self.color = color
        }

        func draw(_ context: GraphicsContext) {
            var context = context

            context.opacity = 0.8

            var path = Path(rect)
            context.fill(path, with: .color(color.opacity(0.5)))

            let centerX = rect.midX
            let centerY = rect.midY

            var centerPath = Path()
            centerPath.move(to: CGPoint(x: centerX - 5, y: centerY))
            centerPath.addLine(to: CGPoint(x: centerX + 5, y: centerY))

            centerPath.move(to: CGPoint(x: centerX, y: centerY - 5))
            centerPath.addLine(to: CGPoint(x: centerX, y: centerY + 5))

            centerPath = centerPath.applying(context.transform).strokedPath(.init())

            path = path.applying(context.transform).strokedPath(.init(lineWidth: 1))

            let textPoint = rect.origin.applying(context.transform)

            context.transform = .identity
            context.stroke(path, with: .color(color))
            context.stroke(centerPath, with: .color(color))

            let text = Text(rect.debugDescription)
                .font(.caption)

            var resolvedText = context.resolve(text)
            resolvedText.shading = .color(color)

            context.opacity = 1.0

            context.draw(resolvedText, at: textPoint, anchor: .bottomLeading)
        }
    }

    extension DrawableRect {
        var bounds: CGRect {
            rect
        }
    }

    extension DrawableRect {
        init(_ rect: MKRect<some BinaryFloatingPoint>, color: Color = .random()) {
            self.init(CGRect(rect), color: color)
        }
    }

#endif
