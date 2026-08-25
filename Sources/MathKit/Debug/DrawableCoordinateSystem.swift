//
//  Created by Kurlovich Vitali on 8/25/26.
//

#if canImport(SwiftUI)

    import SwiftUI

    struct DrawableCoordinateSystem: Drawable {
        let label: String
        let drawables: [any Drawable]

        let layoutDirection: LayoutDirection
        let insets: EdgeInsets

        func draw(_ ctx: GraphicsContext) {
            var context = ctx
            context.transform = transform

            drawAxis(context)

            for drawable in drawables {
                drawable.draw(context)
            }

            if label.isEmpty == false {
                let text = Text(label)
                    .font(.subheadline)
                    .foregroundStyle(.primary)

                let x = bounds.midX
                let y = bounds.maxY

                context.draw(text, at: CGPoint(x: x, y: y), anchor: .bottom)
            }

            if bounds.isNull == false {
                context.stroke(Path(bounds), with: .foreground)
            }
        }

        var bounds: CGRect {
            let bounds = contentBounds

            let (top, left, bottom, right) = insets.resolved(for: layoutDirection)

            let minX = bounds.minX - left
            let maxX = bounds.maxX + right

            let minY = bounds.minY - top
            let maxY = bounds.maxY + bottom

            return .init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
        }
    }

    private extension DrawableCoordinateSystem {
        var transform: CGAffineTransform {
            let bounds = bounds
            return .identity.translatedBy(x: -bounds.minX, y: -bounds.minY)
        }

        var contentBounds: CGRect {
            var iterator = drawables.makeIterator()

            guard var drawable = iterator.next() else {
                return CGRect.null
            }

            var bounds = drawable.bounds

            while let drawable = iterator.next() {
                bounds = bounds.union(drawable.bounds)
            }

            return bounds
        }

        func drawAxis(_ context: GraphicsContext) {
            let bounds = bounds

            var xAxis = Path()
            xAxis.move(to: CGPoint(x: bounds.minX, y: 0))
            xAxis.addLine(to: CGPoint(x: bounds.maxX, y: 0))

            var yAxis = Path()
            yAxis.move(to: CGPoint(x: 0, y: bounds.minY))
            yAxis.addLine(to: CGPoint(x: 0, y: bounds.maxY))

            context.stroke(xAxis, with: .color(.red), style: .init(dash: [1, 5, 1]))
            context.stroke(yAxis, with: .color(.green), style: .init(dash: [1, 5, 1]))
        }
    }

#endif
